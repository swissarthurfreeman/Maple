import evolution.evolution.*; %On importe la fonction evolution du fichier evolution.m
import moindreCarres.moindreCarres.*;

ex3bonus()

function ex3bonus()
    %Donnees est variable obtenue en faisant import data du fichier .dat en
    %matrice.
    donnees = importdata('grippedata.dat');
    Mexp = donnees'; %Je travaille en vecteurs lignes.
        
    t=[0:1:48]; %vecteur temps.
    
    %On affiche les valeurs experimentales. 
    figure; %'o' pour cercles, je mets un titre et des labels pour l'esthetique.
    plot(t, Mexp, 'o'); title('Malades experimentaux en fonction du temps'); xlabel('t'); ylabel('Mexp(t)');
    hold on; %on conserve ce qu'on affiche.
    
    t_final = 48; b = 4; D = 0.28; P = 0.2;  %Param?tres initiaux fournis
    
    N = 157759; R0 = 0; M0 = 3; S0 = N - M0; 
    
    [Sth,Mth,Rth] = evolution(t_final, D, 4, S0, M0, R0); %On calcule notre simulation.
    
    %On affiche le r?sultat.
    plot(t, Mth); title('Malades en fonction du temps'); xlabel('t'); ylabel('M(t)');
    
    disp("L'erreur est: ");
    err = moindreCarres(Mexp, Mth, t_final) %On calcule l'erreur commise par moindre carr?s.
    
    
    disp("Calculons une approximation de la valeur de b:");
    
    %Code pour calculer b, la plus petite erreur que j'ai pu avoir ?tait de
    %1,69e+05, c'est pour cela que j'effectue un while err > 1,69e+05.
    b_app = 2;  %J'initialise b_approximation ? 2.
    while err > 1.69e+05
        b_app = b_app + 0.01; %J'incr?mente de 0.01 pour la pr?cision demand?e.
        if b_app < 5 %Un b_app plus grand que 5 ne fonctionne absolument pas et renvoie des vecteurs NaN.
            [Sth,Mth,Rth] = evolution(t_final, D, b_app, S0, M0, R0); %On effectue la simulation.
            err = moindreCarres(Mexp, Mth, t_final); %On recalcule l'erreur.
        else
            break %Si l'erreur est plus petite, on a finit.
        end
    end
    disp(b_app); %On affiche les r?sultats.
    plot(t, Mth); 
    legend('val experimentales ', 'b = 4',strcat('b = ', num2str(b_app) )  )
end