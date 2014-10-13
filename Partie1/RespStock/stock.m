function [ x ] = stock( )
% cette fonction permet de minimiser le stock global en intégrant des
% contraintes supplémentaires de production

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
    5 5 3 12 8 0;
    1 1 1 1 1 1;
    -1 -1 -1 -1 -1 -1; %(-) Car superieur ou egal 
];

R = zeros(100); %Résultat du stock
for i=1:100  
    B = [350; 620; 485; 4800; 4800; 4800; 4800; 4800; 4800; 4800; 378.8; -(i/100)*378.8];
    f = [5; 5; 6; 10; 5; 4];
    lb = [0;0;0;0;0;0];
    x = linprog(f, A, B,[],[],lb,[]);
    R(i) = f'*x;    
end

hold on
plot(R)
hold off;

    B = [350; 620; 485; 4800; 4800; 4800; 4800; 4800; 4800; 4800; 378.8; -(80/100)*378.8];
    f = [5; 5; 6; 10; 5; 4];
    lb = [0;0;0;0;0;0];
    x = linprog(f, A, B,[],[],lb,[]);
    f'*x
end

