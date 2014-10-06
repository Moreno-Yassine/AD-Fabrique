function [ X ] = COM( A, B, Aeq, Beq)
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


X=linprog(F, A, B, Aeq, Beq, lb, []);

end

