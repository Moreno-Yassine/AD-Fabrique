function [X,Y] = Partie2Calc( Atelier, Stock, Comm, Pers )

%Comptable
f = [-5.67; -12.38; -12.27; -1.03; -31.65; -27.55];

A=[
    1 2 1 5 0 2;
    2 2 1 2 2 1;
    1 0 3 2 2 0;
    8 15 0 5 0 10;
    7 1 2 15 7 12;
    8 1 11 0 10 25;
    2 10 5 4 13 7;
    5 0 0 7 10 27;
    5 3 5 8 0 7;
    5 5 3 12 8 0
];
B = [350; 620; 485; 4800; 4800; 4800; 4800; 4800; 4800; 4800];
Aeq = [-1 -1 -1 1 1 1;
     -1 -1 -1 -1 -1 -1
     -5 -5 -6 -10 -5 -4;
     -13 -1 -11 -7 -20 -50
     ];
 
Beq = [
    -Comm;
    -Atelier;
    -Stock;
    Pers
    ];

lb = transpose([0 0 0 0 0 0]);

X = linprog(f, A, B, Aeq, Beq, lb);
Y = -transpose(X) * f;


end

