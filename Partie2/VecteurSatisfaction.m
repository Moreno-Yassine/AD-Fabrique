function [ Satisfaction ] = VecteurSatisfaction( pointActuel, PM, sol )
%Calcul du vecteur de satisfaction
%Elle nous donne la satisfaction de la solution par rapport au point de
%mire

Satisfaction = zeros(5,1);
Satisfaction(1) = pointActuel(1)./PM(1);
%On veut un benefice maximal donc on divise le benefice par rapport a l'objectif ideal.


Satisfaction(2) = pointActuel(2)./PM(2);
%On veut un nombre de produit maximal donc on divise donc le nombre de produits par rapport a l'objectif ideal.


Satisfaction(3) = PM(3)./pointActuel(3);
%On veut un stock minimal donc on divise donc l'objectif ideal par rapport au stock.


%Pour l'equilibre, nous regardons le rapport entre les deux familles pour
%obtenir la satisfaction. La satisfaction maximale est obtenue quand on
%peut a l'equilibre parfait.
    sol1 = (sol(1) + sol(2) + sol(3)) / (sol(4) + sol(5) + sol(6)) ;
    sol2 = (sol(4) + sol(5) + sol(6)) / (sol(1) + sol(2) + sol(3)) ;
    if sol1<1
        Satisfaction(4) = sol1;
    else
        Satisfaction(4) = sol2;
    end
    
    
Satisfaction(5) = PM(5)./pointActuel(5);
%On veut un temps d'utilisation des machines minimal donc on divise donc l'objectif ideal par rapport au temps d'utilisation des machines.


end

