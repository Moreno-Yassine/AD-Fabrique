function [ Satisfaction ] = Satisfaction( Gain, Solt )
%Calcul de la matrice de satisfaction
%Elle nous donne la satisfaction de la solution par rapport au point de
%mire
%(Satisfaction entre 0 et 1)

Satisfaction = zeros(5,5);
Satisfaction(:,1) = Gain(:,1)./Gain(1,1);
%On veut un benefice maximal donc on divise le benefice par rapport a l'objectif ideal.

Satisfaction(:,2) = Gain(:,2)./Gain(2,2); 
%On veut un nombre de produit maximal donc on divise donc le nombre de produits par rapport a l'objectif ideal.

Satisfaction(:,3) = Gain(3,3)./Gain(:,3);
%On veut un stock minimal donc on divise donc l'objectif ideal par rapport au stock.

%Pour l'equilibre, nous regardons le rapport entre les deux familles pour
%obtenir la satisfaction. La satisfaction maximale est obtenue quand on
%peut a l'equilibre parfait.
for i=1:5;
    sol1 = (Solt(1,i) + Solt(2,i) + Solt(3,i)) / (Solt(4,i) + Solt(5,i) + Solt(6,i));
    sol2 = (Solt(4,i) + Solt(5,i) + Solt(6,i)) / (Solt(1,i) + Solt(2,i) + Solt(3,i));
    if sol1<1
        Satisfaction(i,4) = sol1;
    else
        Satisfaction(i,4) = sol2;
    end
end

Satisfaction(:,5) = Gain(5,5)./Gain(:,5);
%On veut un temps d'utilisation des machines minimal donc on divise donc l'objectif ideal par rapport au temps d'utilisation des machines.

end

