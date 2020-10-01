%% Exemple d'exercice résolu.
%% Partie (i)
%%
% 
%  Il faut d'abord comprendre comment engendrer un nombre entier aléatoire
%  entre -5 et 5. La fonction rand de Matlab retourne un nombre réel entre
%  0 et 1 distribué uniformément. En multipliant celui-ci par 11, en 
%  soustrayant 5 et en prenant la partie entière, on obtient un entier 
%  aléatoire entre -5 et 5 uniformément distribué. Il ne reste plus qu'à 
%  effectuer ces opérations de manière matricielle, élément de matrice par 
%  élément de matrice.
% 
matrice_aleatoire = floor(11*rand(4,4) - 5*ones(4,4))

%% Partie (ii)
%%
% 
%  On calcule 10 fois une telle matrice aléatoire et on enregistre son
%  déterminant dans un vecteur.
% 
for k = [1:10]                     
    matrice_aleatoire = floor(11*rand(4,4) - 5*ones(4,4));
    vecteur_determinants(k) = det(matrice_aleatoire);
end
% Pour éviter d'afficher ".000", comme on travaille avec des entiers.
format rational
% On affiche le vecteur en colonne.
vecteur_determinants'  
%%
% 
%  Aucun des déterminants n'est nul. Pour tenter d'expliquer ce résultat, 
%  on peut essayer d'estimer la proportion de matrice dont le déterminant 
%  est nul. Il y a 11^16 matrices aléatoires de la forme désirée, mais 
%  calculer exactement le nombre de matrice avec un déterminant nul n'est 
%  pas simple.
% 
%% Partie (iii)
%%
% 
%  On va essayer d'estimer la proportion de matrices de déterminant nul
%  dans notre ensemble.
% 

% Compteur enregistrant le nombre de matrice de déterminant nul dans notre 
% ensemble.
nb_mat_det_nul = 0;               
taille_ensemble = 10000;  
for k = [1:taille_ensemble]                                     
    matrice_aleatoire = floor(11*rand(4,4) - 5*ones(4,4));
    % Si le déterminant de la matrice aléatoire est nul, on incrémente le 
    % compteur.
    if det(matrice_aleatoire) == 0
        nb_mat_det_nul = nb_mat_det_nul + 1;
    end
end
% Pour éviter d'avoir trop de nombres après la virgule
format short       
%%
% 
%  La proportion estimée de matrices de déterminant nul est:
% 

Proportion = nb_mat_det_nul/taille_ensemble   

%%
% 
%  Il n'est donc pas étonnant que dans notre petit échantillon de 10
%  matrices, on n'en trouve aucune dont le déterminant est nul.
% 
