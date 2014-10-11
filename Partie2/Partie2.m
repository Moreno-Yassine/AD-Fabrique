function [] = Partie2()

F_compta = [-5.67; -12.38; -12.27; -1.03; -31.65; -27.55];
F_respAtelier = [-1; -1; -1; -1; -1; -1];
F_respStock = [-5; -5; -6; -10; -5; -4];
F_respCom=[-1;-1;-1;1;1;1];
F_respPers=[-13;-1;-11;-7;-20;-50];

sol_compta = [0;23.51;0;0;242.5;87.96];
sol_respAtelier = [0;56.73;38.69;0;184.46;98.92];
sol_respStock = [38.3473;25.4708;0.0000;0.0000;108.8663;130.3556];
sol_respCom = [142.12;0;44.42;0;104.81;81.73];
sol_respPers =[0;174.38;1.23;0;135;0];


Ft = [F_compta,F_respAtelier,F_respStock,F_respCom,F_respPers];
Solt = [sol_compta,sol_respAtelier,sol_respStock,sol_respCom,sol_respPers];

%Point de Mire : 
PM = [10389; 378.8; 1385; 0; 2887.9]; 
Gain = -transpose(Solt)*Ft

%Matrice de Satisfaction
Satisfaction(Gain, Solt)


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
    5 0 0 7 10 27;
    5 3 5 8 0 7;
    5 5 3 12 8 0;
    -1 -1 -1 -1 -1 -1; %Resp Atelier
    -5 -5 -6 -10 -5 -4; %resp Stock
    -1 -1 -1 1 1 1; %resp Comm
    -13 -1 -11 -7 -20 -50; %resp Perso
];

B = [350; 620; 485; 4800; 4800; 4800; 4800; 4800; 4800; 4800; -358.8; -1385; -0; -2887.9];
B = [350; 620; 485; 4800; 4800; 4800; 4800; 4800; 4800; 4800; -339; -1425; 70; -2575];
B = [350; 620; 485; 4800; 4800; 4800; 4800; 4800; 4800; 4800; -339; -1425; 70; -2575];

sol_comptable = comptable(A,B);

%Point de Mire : 
PM = [10389; 378.8; 1385; 0; 2887.9]; 
pointActuel = [-F_compta' * sol_comptable; -F_respAtelier' * sol_comptable; -F_respStock' * sol_comptable; -F_respCom' * sol_comptable; -F_respPers' * sol_comptable]


VecteurSatisfaction(pointActuel, PM, sol_comptable)


end

