%TP1 Lundi 17 Fevrier.
%Serie 1.)

%ex1();
%ex2();
%ex3();
%ex4();
%ex5();
%ex6();
%ex7();
%ex8(6);
%ex9();
ex10(8);

function ex1()
    %Declaration de variables.
    q = [-2;1]; r = [3;0];
    s = [1;-2;-3]; t = [1;1;1]; u = [-2;4;-1];
    v = [-25:24]'; w = [100:-2:2]';
   
    %1.)
   res11 = q - r;
   %res12 = q + 3*v %Impossible, dimension imcompatibles.
   res13 = s + 3*t - u;
   
   %2.)
   res21 = dot(q,r);
   res22 = dot(s,s) - 2*dot(s,t) - dot(s,u);
   res23 = dot(v,w);
   res24 = dot(v,v);
   
   %3.)
   res31 = norm(v);
   res32 = norm(s)^2;
end

function ex2()
    mat1 = [1 0 1; 0 1 0; 1 0 1];
    mat2 = [0 1 0; 1 0 1; 0 1 0];
    res = mat1.*mat2;
    %non, car det(A*B) = det(A)*det(B) ce qui veut dire
    %que une de determinants sera nul, donc matrice non inversible.
end

function ex3()
    %Exercice 3.1.)
    a = [1;1]
    lambda = 5
    v = [a(1,1) + cos(pi/6)*lambda; a(2,1) + sin(pi/6)*lambda]
    b = a + v
    c = b + [-v(2,1);v(1,1)]
    d = c - v
    x1 = [a(1,1), b(1,1), c(1,1), d(1,1),a(1,1)]
    y1 = [a(2,1), b(2,1), c(2,1), d(2,1),a(2,1)]
    %plot(x1,y1), axis equal
    
    %Exercice 3.2.)
    n = 30;
    for k = [1:n]
       x2(k) = cos((2*pi/n)*k)
       y2(k) = sin((2*pi/n)*k)
    end
    x2(n+1) = x2(1)
    y2(n+1) = y2(1)
    %figure
    %plot(x2,y2), axis equal
   
    %Exercice 3.3.)
    n = 5;
    for k = [1:n]
       x3(k) = cos((2*pi/n)*k)
       y3(k) = sin((2*pi/n)*k)
    end
    x3(n+1) = x3(1)
    y3(n+1) = y3(1)
    figure
     
    plot(x3,y3), axis equal
    hold on
    plot([x3(1) x3(1)],[y3(4) y3(6)])
    plot([x3(2) x3(1)],[y3(3) y3(6)])
    
    plot([x3(5) x3(2)],[y3(5) y3(2)])
    
    plot([x3(2) x3(5)],[y3(3) y3(5)])
    plot([x3(1) x3(2)],[y3(4) y3(2)])
end

function ex4()
    %4.1.1.)
    x1 = [0:0.01:3];
    y1 = x1.^x1
    plot(x1,y1), grid, axis equal
    
    %4.1.2.)
    x2 = [0:100];
    y2 = x2*0 + 3;
    figure
    plot(x2,y2);
    
    %4.1.3.)
    x3 = [0:100];
    y3 = log(x3)/log(3);
    figure
    plot(x3,y3);
    
    %4.1.4.)
    x4 = [1:0.01:9.995]; %bizarrerie de matlab
    for p=[1:900]       %cela renvoie une matrice de 901 ?l?ments (x4) si on mets 10 au lieu de 9.995...
        disp(p)
        y4(p) = 1/x4(p); 
    end
    figure
    disp(size(y4))
    disp(size(x4))
    plot(x4,y4), axis equal
    
    %4.2.)
    %Pour x^x = 3, x = 1.8534 environ.
    %C'est la m?me, en repr?sentant sur le m?me graphique, on trouverait
    %une intersection.
    
end

function ex5()
    %5.1.) A*X = B, on cherche X.
    A1 = [6,1,-5; 2,1,3;4,-9,7];
    B1 = [6;11;12];
    X1 = A1\B1;
    disp(X1); %Cela se trouve en ?crivant sous forme matricielle.
    
    %5.2.)
    A2 = [6,1,-7; 2,2,3;8,3,-4];
    B2 = [10;2;12];
    X2 = A2\B2;
    disp(X2); %Ce syst?me n'admet pas de solution.
    
    %5.3.)
    A3 = [1,2,3,4; 2,3,4,1;-2,4,-5,2;8,1,-1,3];
    B3 = [1;-2;0;1];
    X3 = A3\B3;
    disp(X3);
end

function ex6()
    T = 0.25*[1,-3,1,1;-3,1,1,1;1,1,7,-9;1,1,-9,7];
    %6.1.) Le noyau est {x:f(x) = 0} c.?.d les solutions du syst?me T*N =
    %0. Calculons le, (N pour noyau)
    N = null(T);
    dim = size(N); dim = dim(1,1);
    disp("Noyau: ");
    disp(N);
    
    %6.2.) Orthogonale d'une matrice = Ker(T)^T (T invers?) = {v : <v,w> = 0 forall w in KerT}
    A = [N';zeros(3,4)];
    B_ortho = null(A); %null(A) est la base de l'espace orthogonal.
    disp("Base de l'orthogonale (colonnes = vecteurs): ");
    disp(B_ortho);
    
    %6.3.) Invariance, on veut v?rifier que T*v in H = vec{B_ortho} ou
    %v1,v2,v3 sont les vecteurs de B_ortho.
    disp("Invariance de la base orthogonale:");
    vim_1 = T*B_ortho(:,1)
    vim_2 = T*B_ortho(:,2)
    vim_3 = T*B_ortho(:,3)
    
    disp("Produits scalaires entre images des vecteurs de base orthogonale par T");
    disp("on voit que c'est presque 0, e-16 = 0 en float, donc c'est correct."); disp(" ");
    disp(dot(vim_1, N(:,1))) %C'est donc invariant.
    disp(dot(vim_1, N(:,1)))
    disp(dot(vim_1, N(:,1)))
    
    %6.4.) (f(v) = lambda*v => v vecteur propre)
    %Il faut r?soudre T*v = lambda*v pour chaque lambda, donc (T -
    %lambda*Id)*v = 0
    disp("Eigenvectors:");
    [V, D] = eig(T); %D = matrice of eigenvalues,  V = matrice of eigenvectors.
    disp(V);
    disp("Eigenvalues:");
    disp(D);
    
    %6.5.)
    disp("H dans la base des vecteurs propres:");
    H_val_propres = V*D*V^(-1)
    
    
    %6.6.)
    P_T = T^2 + 2*T + eye(4,4);
    [V_P_T, D_P_T] = eig(P_T);
    disp("Valeurs propres de P(T) (Sp(P(T))):");
    disp(D_P_T);   
end

function ex7()
    disp("Ex 7.)");
    n = 4;
    A = rand(n,n);
    B = A\diag(A)
end

function ex8(n)
   for r = [1:n]
       for p = [1:n]
           vand(r,p) = p^(r-1);
       end
   end
   disp(vand);
end

function ex9()
    %On d?finit un endomorphisme, R^2 dans R^2.
    M_f = [1,1;3,4]
    
    %Avec une nouvelle base de d?part et d'arriv?e.
    B_eiprime = [3,2;0,4]
    B_epsilonprime = [4,5;0,1]
    
    %On d?finit les matrices de passage comme ceci.
    P_ei_eiprime = B_eiprime \ eye(size(B_eiprime))
    P_epsilon_epsilonprime = B_epsilonprime \ eye(size(B_epsilonprime))
    
    %On calcule la matrice de l'application dans les nouvelles bases.
    %Attention, Grifone a fait une faute, il faut faire: A' = Q*A*P^-1
    M_eiprime_epsilonjprime = (P_epsilon_epsilonprime)*M_f*P_ei_eiprime^(-1)
    
    %On v?rifie avec x = (2,1) = M(x)ei
    X = [2;1]
    image_x_epsilon = M_f*X %M(f(x))epsilon
    
    X_prime = P_ei_eiprime*X %M(x)eiprime
    image_x_epsilonprime = M_eiprime_epsilonjprime*X_prime %M(f(x))epsilonprime
    
    disp("En reconvertissant dans la base epsilon:")
    disp((P_epsilon_epsilonprime^(-1))*image_x_epsilonprime) %On affiche M(f(x))epsilon 
    disp("cela marche! Grifone s'est trompe!")
end

function ex10(n)
    %Pour r?f?rence:
    %disp(diag(diag(rand(4)))) %extrait la matrice diagonale.
    %disp(diag(rand(4))) %extrait le vecteur colonne diagonale.

    %Ex 1.)
    B_tilde = eye(n+1) + diag(ones(1,n-1),2);
    B = eye(n+1)
    M_Btilde = zeros(n+1);
    M_Btilde(1,1) = 1;
    M_Btilde(2,2) = 1;
   
    M_B_Btilde = B / B_tilde;
    M_Btilde_B = M_B_Btilde^(-1);
    
    M_B = M_Btilde_B*M_Btilde*M_B_Btilde;
    
    %Ex 2.)
   	%7x 8 + 411x 7 ? 231x 5 + 31x 4 + 451x 3 ? 10x ? 42 ;
    %x 7 + 5 21x 5 + 0.432x 4 ? 22x 3 + 51x 2
    
    disp("Reste de division polynomiale de a.)");
    disp(M_B*[7;411;0;-231;31;451;0;-10;-42]);
    
    disp("Reste de division polynomiale b.)")
    disp(M_B*[0;1;0;5/21;0.432;-22;51;0;0]);
    
    %Ex 3.)
    M_dB = zeros(n+1) + diag([0:1:n]);
    [V,D] = eig(M_dB)
    
    %Ex 4.)
    disp("M_dB*M_B");
    disp(M_dB*M_B);
    
    %On remarque que la d?riv?e d'un reste et le reste d'une d?riv?e
    %n'ont rien ? voir!
    
    disp("M_B*M_dB");
    disp(M_B*M_dB);
    
end


