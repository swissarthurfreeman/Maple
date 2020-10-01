import evolution.evolution.*; %On importe la fonction evolution du fichier evolution.m

ex4bonus()
function ex4bonus()
    donnees = importdata('grippedata.dat');
    
    Mexp = donnees'; %Je travaille en vecteurs lignes.
        
    t=[0:1:48];
    
    %On affiche les valeurs experimentales. 
    plot(t, Mexp, 'o'); title('Malades en fonction du temps'); xlabel('t'); ylabel('M(t)');
    hold on;
    
    %Je r?initialise les valeurs pour chaque cas.
    t_final = 48; b = 4.05; D = 0.28; P = 0.2;
    N = 157759;  M0 = 3; S0 = N - M0; R0 = 0;
    
    [Sth,Mth,Rth] = evolution(t_final, D, b, S0, M0, R0); %On calcule... 
    plot(t, Mth, 'r'); %On affiche...
    disp("Le nombre de personnes touchees sans mesures: ");
    disp(Rth(49)-R0 + Mth(49));
    
    %1.) Vaccination, 5%100 * 157759 = 7887.95 ~ 7888 personnes.
    R0 = 7888;
    
    [Sth,Mth,Rth] = evolution(t_final, D, b, S0, M0, R0);
    plot(t, Mth, 'g');
    disp("Le nombre de personnes touchees avec vaccin: ");
    disp(Rth(49)-R0 + Mth(49));
    
    t_final = 48; b = 4.05; D = 0.28; P = 0.2; %On r?initialise les param?tres...
    N = 157759;  M0 = 3; S0 = N - M0; R0 = 0;
    
    %2.) Distanciation et education
    b = 0.95*b; 
    [Sth,Mth,Rth] = evolution(t_final, D, b, S0, M0, R0);
    plot(t, Mth, 'b');
    disp("Le nombre de personnes touchees avec distanciation: ");
    disp(Rth(49)-R0 + Mth(49));
    
    t_final = 48; b = 4.05; D = 0.28; P = 0.2; %On r?initialise les param?tres...
    N = 157759;  M0 = 3; S0 = N - M0; R0 = 0;
    
    %3.) Medication
    D = 0.95*D;
    [Sth,Mth,Rth] = evolution(t_final, D, b, S0, M0, R0);
    plot(t, Mth, 'black');
    disp("Le nombre de personnes touchees avec medication: ");
    disp(Rth(49)-R0 + Mth(49));
    
    %Je mets une legende pour l'esthetique.
    legend('Valeurs experimentales', 'Aucune mesure', 'Vaccination', 'Distanciation et education', 'Medication');
end