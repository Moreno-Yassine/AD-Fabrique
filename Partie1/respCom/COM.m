function [ x ] = COM( A, B, Aeq, Beq)
%Cette fonction permet de calculer et minimiser l'ecart de production
%entre les deux categorie de produit. Elle calcule le nombre de chaque 
%produits à fabriquer correspondant.

f=[-1 ; -1; -1; -1; -1; -1 ];
lb = [0; 0; 0; 0; 0; 0];
x=linprog(f, A, B, Aeq, Beq, lb, []);

end

