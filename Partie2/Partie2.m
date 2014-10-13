function [] = Partie2()
%---Solutions Partie 1 ---%
F_compta = [-5.67; -11.88; -12.27; -1.03; -31.65; -27.55];
F_respAtelier = [-1; -1; -1; -1; -1; -1];
F_respStock = [-5; -5; -6; -10; -5; -4];
F_respCom=[-1;-1;-1;1;1;1];
F_respPers=[-13;-1;-11;-7;-20;-50];

sol_compta = [0;20.41;0;0;242.5;94.18];
sol_respAtelier = [0;56.73;38.69;0;184.46;98.92];
sol_respStock = [38.3473;25.4708;0.0000;0.0000;108.8663;130.3556];
sol_respCom = [142.12;0;44.42;0;104.81;81.73];
sol_respPers =[0;174.38;1.23;0;135;0];
%---Fin Solutions Partie 1 ---%


%---Calcul Matrice Gain---%
Ft = [F_compta,F_respAtelier,F_respStock,F_respCom,F_respPers];
Solt = [sol_compta,sol_respAtelier,sol_respStock,sol_respCom,sol_respPers];

PM = [10512; 378.8; 1385; 0; 2887.9];  %Point de Mire

Gain = -transpose(Solt)*Ft
%---Fin Calcul Matrice Gain---%

Satisfaction(Gain, Solt) %Matrice de Satisfaction


%---Ajustement de la solution ---%


%On place Tous les responsables sauf le compta en contrainte, 
%on ajuste puis on recalcule
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
    -1 -1 -1 -1 -1 -1; %Resp Atelier
    -5 -5 -6 -10 -5 -4; %resp Stock
    -1 -1 -1 1 1 1; %resp Comm
    -13 -1 -11 -7 -20 -50; %resp Perso
];


%Reduire produits 378.8
%Augmenter Stock 1385
%Reduire ou augmenter Comm
%Augmenter Personnel 2887.9
B = [350; 620; 485; 4800; 4800; 4800; 4800; 4800; 4800; 4800; -358.8; -1385; -0; -2887.9];
B = [350; 620; 485; 4800; 4800; 4800; 4800; 4800; 4800; 4800; -320; -1425; 25; -3075];
B = [350; 620; 485; 4800; 4800; 4800; 4800; 4800; 4800; 4800; -340; -1450; -25; -2990];
B = [350; 620; 485; 4800; 4800; 4800; 4800; 4800; 4800; 4800; -290; -1490; -25; -3090];
B = [350; 620; 485; 4800; 4800; 4800; 4800; 4800; 4800; 4800; -339; -1425; 70; -2575];
B = [350; 620; 485; 4800; 4800; 4800; 4800; 4800; 4800; 4800; -339; -1425; 40; -3075]; %Solution Retenue


sol_comptable = comptable(A,B);

PM = [10512; 378.8; 1385; 0; 2887.9]; %Point de Mire  
pointActuel = [-F_compta' * sol_comptable; -F_respAtelier' * sol_comptable; -F_respStock' * sol_comptable; -F_respCom' * sol_comptable; -F_respPers' * sol_comptable]


VecteurSatisfaction(pointActuel, PM, sol_comptable)


end

