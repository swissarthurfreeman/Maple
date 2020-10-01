%Fonction qui renvoie les vecteurs du nombre de personnes sains, malades
%et r?tablies, ou chaque i-eme case correspond ? la i-eme semaine.
function [S,M,R] = evolution(t_final, D, b, S0, M0, R0)
    %On initialise les vecteurs sains et malades.
    %ce seront des vecteurs lignes.
    Se(1) = S0; Me(1) = M0; Re(1) = R0; 
    N = S0 + M0 + R0;
    for t = 1:t_final %C'est le modele demande dans le rapport.
       Se(t + 1) = Se(t) - (b/N)*Se(t)*Me(t); %On calcule le modele recursivement.
       Me(t + 1) = Me(t) + (b/N)*Se(t)*Me(t) - Me(t)/D;
       Re(t + 1) = Re(t) + Me(t)/D;
    end
    S = Se; M = Me; R = Re; %On renvoie les vecteurs calcules.
end