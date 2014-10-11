function [ Satisfaction ] = VecteurSatisfaction( pointActuel, PM, sol )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


Satisfaction = zeros(5,1);
Satisfaction(1) = pointActuel(1)./PM(1);
Satisfaction(2) = pointActuel(2)./PM(2);
Satisfaction(3) = PM(3)./pointActuel(3);

    sol1 = (sol(1) + sol(2) + sol(3)) / (sol(4) + sol(5) + sol(6)) ;
    sol2 = (sol(4) + sol(5) + sol(6)) / (sol(1) + sol(2) + sol(3)) ;
    if sol1<1
        Satisfaction(4) = sol1;
    else
        Satisfaction(4) = sol2;
    end
Satisfaction(5) = PM(5)./pointActuel(5);


end

