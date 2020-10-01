%Exercice 1.) Bonus MatLab, Arthur Freeman 30/03/2020
function ex1()
    %19 uns, car on veut que des uns sur la premiere diagonale superieure,
    %qui a une taille de n - 1.
    v = ones(1,19);
    disp(v)
    M = diag(v,1)

    disp(M^20); %Elle est nilpotente pour n = 20!
    
    %Simple boucle for sur un vecteur.
    vl(1) = 0;
    for k=1:20
        vl(k+1) = 2*vl(k)+ 5; %Condition demandee.
    end
    disp(vl)
end