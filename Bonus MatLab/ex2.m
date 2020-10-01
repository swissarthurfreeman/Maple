%Exercice 2.) Bonus MatLab, Arthur Freeman 30/03/2020
import evolution.evolution.*; %On importe la fonction evolution du fichier evolution.m

ex2bonus();
function ex2bonus()
    S0 = 157756; M0 = 3; R0 = 0; %Parametres initiaux.
    t_i = 0; t_final = 48;
    
    %Ex 2.2.) Parametres fournis.
    D = 0.28;
    b = 4;
    
    %Fonction evolution qui renvoie les sains, malades et retablis.
    [S,M,R] = evolution(t_final, D, b, S0, M0, R0); %Evolution contenue dans evolution.m
    
    %t est en semaines, donc un entier naturel allant de la semaine z?ro
    %? la semaine finale (ici 48).
    t = [t_i:1:t_final];
    
    %Affichage du r?sultat. Je nomme mes axes pour l'esthetique. 
    plot(t, S); title('Sains en fonction du temps'); xlabel('t'); ylabel('S(t)');
    figure; %Figure cr?e une nouvelle fen?tre.
    plot(t, R); title('Retablis en fonction du temps'); xlabel('t'); ylabel('R(t)');
    figure;
    plot(t, M); title('Malades en fonction du temps'); xlabel('t'); ylabel('M(t)');
end 