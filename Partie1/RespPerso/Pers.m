function [ X ] = Pers()
%Cette fonction permet de calculer et minimiser le temps d'utilisation des
%machines 3 et 5, en intégrant des contraintes supplémentaires

A=[
    1 2 1 5 0 2;
    2 2 1 2 2 1;
    1 0 3 2 2 0;
    8 15 0 5 0 10;
    7 1 2 15 7 12;
    8 1 11 0 10 25;
    2 10 5 4 13 7;
    5 0 0 7 10 25;
    5 3 5 8 0 7;
    5 5 3 12 8 0;
    1 1 1 1 1 1;
    -1 -1 -1 -1 -1 -1; %(-) Car superieur ou egal 
];

R = zeros(100); %Temps machine total
R3 = zeros(100);%Temps machine 3
R5 = zeros(100);%Temps machine 5
for i=1:100
    
    B = [350; 620; 485; 4800; 4800; 4800; 4800; 4800; 4800; 4800; 378.8; -(i/100)*378.8];
    lb = [0;0;0;0;0;0;];

    f=[13;1;11;7;20;50];%fonction Temps machine total
    x = linprog(f, A, B,[],[],lb,[]);
    R(i) = f'*x;
    
    f=[8;1;11;0;10;25];%fonctionTemps machine 3
    R3(i) = f'*x;
    
    f=[5;0;0;7;10;25];%fonction Temps machine 5
    R5(i) = f'*x;
    
end

subplot(3,1,1), plot(R)
subplot(3,1,2), plot(R3)
subplot(3,1,3), plot(R5)


%solution optimale à 82%
    B = [350; 620; 485; 4800; 4800; 4800; 4800; 4800; 4800; 4800; 378.8; -(82/100)*378.8];
    lb = [0;0;0;0;0;0;];

    f=[13;1;11;7;20;50];
    x = linprog(f, A, B,[],[],lb,[]);
    f'*x
    
    f=[8;1;11;0;10;25];
    f'*x
    
    f=[5;0;0;7;10;25];
    f'*x
    
    x
end

