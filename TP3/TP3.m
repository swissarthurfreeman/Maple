%TP3 Arthur Freeman 16/03/2020
%disp(data1); %Matrice n x 2 de valeurs.

%regressionAffine(data1); %Cela donne exactement le m?me r?sultat entre regAf2 et regAf.
%regressionAffine2(data1); %Cela marche tr?s bien pour les r?gr?ssions lin?aires.

%regressionAffine2(data2);
%regressionAffine2(data3); %?a marche pas top pour data3.
%regressionAffine(data4); %Il faut un cercle pas une droite pour data4!

%Ex 1.4.) Tres bonne question...

%regressionCirculaire(data4);
ex3(datag);

function [a,b] = regressionAffine(M) 
    %M est matrice n x 2 de x_i et y_i
    squareM = M.^2;
    sumSquareM = sum(squareM);
    sumM = sum(M);
    n = size(M); n = n(1);
    
    A = [sumSquareM(1), sumM(1); sumM(1), n];
    B = [sum( M(:,1).*M(:,2) ); sumM(2) ];
    
    disp("Methode MatLab.");
    X = A \ B
    
    figure;
    plot(M(:,1), M(:,2), 'ob');
    hold on;
    
    Y = X(1)*M(:,1) + X(2);
    plot(M(:,1),Y, '-r');
end

function regressionAffine2(M)
    A = [M(:,1), ones(size(M(:,1)))];
    B = M(:,2);
    disp("Methode Moindre carr?s.");
    X = A \ B
    Y = X(1)*M(:,1) + X(2);
    figure;
    plot(M(:,1), M(:,2), 'ob');
    hold on;
    plot(M(:,1),Y, '-r'); 
end

function regressionCirculaire(M)
    %M est matrixe [X,Y] size(M) = n x 2.
    X = M(:,1); Y = M(:,2); 
    xiyi2 = X.*(Y.^2);
    yixi2 =  Y.*(X.^2);
    xi2 = X.^2; xi3 = X.^3; yi2 = Y.^2; yi3 = Y.^3;
    xiyi = X.*Y;
    
    n = size(X);
    n = n(1);
    
    B = [sum(xi3) + sum(xiyi2); sum(yixi2) + sum(yi3) ; sum(xi2) + sum(yi2)];
   
    A = [
        2*sum(xi2), 2*sum(xiyi), -1*sum(X); 
        2*sum(xiyi), 2*sum(yi2), -1*sum(Y);
        2*sum(X), 2*sum(Y), -n
    ];

    S = A \ B
    figure;
    plot(X,Y, 'ob');
    hold on;
    t = [-1.45:0.01:8.5]';
    a = S(1); b = S(2); u = S(3);
    Yplot1 = sqrt( a^2 + b^2 - u - (t - a).^2 ) + b;
    Yplot2 = -sqrt( a^2 + b^2 - u - (t - a).^2 ) + b;
    plot(t, Yplot1, '-r');
    hold on;
    plot(t,Yplot2, '-r');
end

%Famille des courbes gausiennes.
function fax = funcFit(a,x)
    fax = a(1).*exp( (-(x-a(2)).^2) / (a(3).^2) );
end

function ex3(M)
    h = histogram(M,2000); %Ex 3.1.)
    n = size(h.BinEdges)
    n = n(2)
    
    %On calcule les valeurs centr?es des bins. (R?cursivement).
    for k=1:(n-1) %Ex 3.2.)
        centresBins(k) = (h.BinEdges(k)+h.BinEdges(k+1))/2;
    end
    
    hold on; %On affiche en rouge.
    plot(centresBins, h.Values);
    
    p0 = [150;81;6]; 
    %p0 doit ?tre un t?ton suffisament bon pour que l'algorithme
    %fonctionne!
    %Ex 3.6.) En augmentant le nombre de bins, les param?tres changent,
    %l'amplitude devient de plus en plus petite.
    %si on mets le maximum de bins, on obtient une loi normale d'amplitude
    %beaucoup plus petite mais de m?me valeur moyenne et ?cart-type.
    %C'est donc surtout l'amplitude qui change!
    pf = nlinfit(centresBins, h.Values, @funcFit, p0)
    hold on;
    t = [65:0.01:95]; 
    Y = funcFit(pf, t); %On calcule le nouveau vecteur images.
    plot(t, Y, 'g', 'LineWidth', 2); %On affiche le fit avec les param?tres obtenus via nlinfit.
end