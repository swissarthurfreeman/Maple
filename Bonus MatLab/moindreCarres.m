%Fonction calculant l'erreur (~diff?rence) entre deux vecteurs.
function eps = moindreCarres(Mexp, Mth, t_final) %eps pour epsilon.
    res = 0; %On initialise l'erreur ? nulle.
    for t = 1:t_final %On applique la d?finition de epsilon pour tout ?l?ment des vecteurs.
       res =  res + (Mexp(t) - Mth(t) )^2;
    end
    eps = res; %On renvoie la valeur calcul?e.
end