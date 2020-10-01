%TP2, commenc? le 28/02/2020
%Arthur Freeman BSCI
TP_2();


function TP_2()       
    %Exercice 1.)
    function [u1,u2,n] = BaseR3(P1,P2,P3)
        %pi sont vecteurs colonne pi = (x,y,z)
        u1 = (P1-P2)/norm(P1-P2); %choix arbitraires
        u2 = (P2-P3)/norm(P2-P3); %ces vecteurs sont parall?les au plan.
        n = cross(u1,u2)/norm(cross(u1,u2)) %renvoie le vecteur normal.
    end %pas de return, on assigne juste les valeurs de retour.
    
    P1 = [3,4,-1]'; P2 = [5,3,-1]'; P3 = [5,5,1]';
    %BaseR3(P1,P2,P3) %?a marche.
    
    
    %Exercice 2.)
    %Fonction qui retourne B ? partir de A en dehors de pi
    %?tant donn? P1,P2,P3 sur pi.
    
    u1_global = 0; %Je d?finit ces points comme ceci
    u2_global = 0; %, de fa?on ? pouvoir m'en servir ou je veux.
    function [B,u1,u2] = projPointPlan(P1,P2,P3, A)
           [u1,u2,n] = BaseR3(P1,P2,P3);
           coefs = [u1,u2,n] \ (A-P1);
           %On ajoute P1 pour se placer dans le plan.
           proj = P1 + coefs(1)*u1 + coefs(2)*u2;
           u1_global = u1;
           u2_global = u2; %On les assigne.
           B = proj;
    end

    A = [2,0,1]'; %A fait d?j? partie du plan! donc sa projection est lui m?me.
    B = projPointPlan(P1,P2,P3,A)
    
    %disp(dot( (B-A), [-0.333, -0.6667, 0.6667]')) %le produit scalaire est nul,
    %cela implique que les vecteurs sont perpendiculaires (via le thm du
    %cosinus) a.b = norm a * norm b * cos(angle entre a et b)    
    
    %Exercice 4.)
    t = [0:0.0001:1]';  
    X = 5+sin(20*pi*t); Y = 5.5+sin(18*pi*t); Z = -4+sin(22*pi*t);
    disp(size(X))
    
    
    
    function [xp,yp,zp] = Perspective(A,B,u1,u2,x,y,z)
       %Cette fonction doit marcher pour tout point.
       %X est vecteur colonne de toutes les positions en X, Y, Z idem.
       %AP doit ?tre le vecteur qui contient tous les AP pour chaque X,Y,Z
       %AP doit ?tre vecteur ligne de vecteurs colonnes.
       AP(1,:) = X - A(1);
       AP(2,:) = Y - A(2);
       AP(3,:) = Z - A(3);
       
       AB = B - A;
       
       
       disp(size(AP))
       %lambda sera vecteur ligne de lambdas pour chaque vecteur.
       
       disp(size(AB))
       
       lamb = sum(AP(:,:).*AB)
       lamb = lamb.^(-1)
       lamb = dot(AB,AB)*lamb;
       
       %P_prime sera les images de chaque vecteur.
       %P_prime est vecteur ligne de vecteurs colonnes.
       P_prime = lamb(1,:).*AP + A;
       xp = P_prime(1,:);
       yp = P_prime(2,:);
       zp = P_prime(3,:);
    end
    
    [X_prime, Y_prime, Z_prime] =  Perspective(A,B,u1_global,u2_global,X,Y,Z);
    
    afficheResultat();
    function afficheResultat()
        view(3);
        axis equal;
        
        subplot(1,2,1);
        axis equal;
        plot(X_prime, Y_prime, 'Color', 'm');
        
        
        subplot(1,2,2);
        
        %On affiche la projection C.
        plot3(X_prime, Y_prime, Z_prime, 'Color', 'm');
        hold on;
        
        %On affiche le point A.
        plot3(A(1),A(2),A(3), 'Marker', '.','Color', 'r');
        hold on;
        
        %On affiche la projection de A sur pi B.
        plot3(B(1),B(2),B(3), 'Marker', '.', 'Color', 'b');
        xlabel("Axe des x");ylabel("Axe des y");zlabel("Axe des z");
        hold on;
        
        %On dessine le vecteur AB
        quiver3(B(1),B(2),B(3), A(1) - B(1),A(2) - B(2),A(3) - B(3));
        axis equal;
        hold on;
        
        %On affiche le plan pi.
        AffichagePlan(B, u1_global, u2_global, 3);
        hold on;
        
        %On affiche la fonction C.
        plot3(X,Y,Z, 'Color', 'g');
        hold on; 
    end
end



