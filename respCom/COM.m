function [ X ] = COM( A, B)
%fonction pour minimiser l'ecart de prod entre les deux categorie de
%produit

F=[-1 ;
    -1;
    -1; 
    -1; 
    -1;
    -1;
    ];

lb = [0;
    0; 
    0; 
    0;
    0;
    0;
    ];

matrice;

X=linprog(F, Aeq, beq, [], [], lb, []);

end

