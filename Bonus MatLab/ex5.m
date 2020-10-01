ex5bonus()
function ex5bonus()
    N = 5000; %Taille de la matrice.
    M = rand(N); %Renvoie une matrice a coefficients al?atoires de taille N.
    m = (M + M') / 2; %on d?finit m comme dans le rapport.
    [V,D] = eig(m); %On r?cup?re les valeurs propres.
    val_propres = diag(D)'; %On r?cup?re la diagonale et on la mets en vecteur colonne.
    val_propres(N) = []; %On vire la derni?re valeur propre, qui est celle qui est immense par rapport aux autres.
    disp(val_propres');
    histogram(val_propres); %On voit que cela fait bien un demi-cercle !
end