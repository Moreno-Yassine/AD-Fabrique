function [ X ] = Pers( A, B)
%fonction RespPerso

F=[13;1;11;7;20;50];
lb = [0;
    0; 
    0; 
    0;
    0;
    0;
    ];

X=linprog(F, A, B, [],[],lb, []);

end

