function [x] = respAtelier( A,B )
%Cette fonction permet de calculer le nombre de produit maximal à fabriquer
%et de calculer le nombre de chaque produits à fabriquer correspondant.

%Equation
%f(a,b,c,d,e,f) = a+b+c+d+e+f (maximiser)

f = [-1; -1; -1; -1; -1; -1];
lb = [0;0;0;0;0;0];
x = linprog(f, A, B,[],[],lb,[]); 

Result = -f'*x
end

