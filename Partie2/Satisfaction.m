function [ Satisfaction ] = Satisfaction( Gain, Solt )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Satisfaction = zeros(5,5);
Satisfaction(:,1) = Gain(:,1)./Gain(1,1);
Satisfaction(:,2) = Gain(:,2)./Gain(2,2);
Satisfaction(:,3) = Gain(3,3)./Gain(:,3);
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
end

