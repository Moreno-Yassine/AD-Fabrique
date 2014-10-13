function [ x ] = comptable( A, B )
%Cette fonction permet de calculer le benefice maximal pour le comptable
%et de calculer le nombre de chaque produits à fabriquer correspondant.

%Equation 
%5.67A + 11.88B + 12.27C + 1.03D + 31.65E + 27.55F

f = [-5.67; -11.88; -12.27; -1.03; -31.65; -27.55];
lb = [0;0;0;0;0;0];
x = linprog(f, A, B,[],[],lb); 

result = -f' * x
end

