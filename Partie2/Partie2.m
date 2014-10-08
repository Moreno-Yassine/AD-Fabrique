function [ compta,respAtelier,respStock,respCom,respPers ] = Partie2()

opti_compta = 10390;
opti_respAtelier = 378.8;
opti_respStock = 715;
opti_respCom = 373.06;
opti_respPers = 2887.9;



F_compta = [-5.67; -12.38; -12.27; -1.03; -31.65; -27.55];
F_respAtelier = [-1; -1; -1; -1; -1; -1];
F_respStock = [-5; -5; -6; -10; -5; -4];
F_respCom=[-1;-1;-1;1;1;1];
F_respPers=[-13;-1;-11;-7;-20;-50];


sol_compta = [0;23.51;0;0;242.5;87.96];
sol_respAtelier = [0;56.73;38.69;0;184.46;98.92];
sol_respStock = [0;0;0;0;3.03;175];
sol_respCom = [142.12;0;44.42;0;104.81;81.73];
sol_respPers =[0;174.38;1.23;0;135;0];


Ft = [F_compta,F_respAtelier,F_respStock,F_respCom,F_respPers];
Solt = [sol_compta,sol_respAtelier,sol_respStock,sol_respCom,sol_respPers];


%Point de Mire : 
PM = [10389; 379; 715; 0; 2888]; 
Gain = -transpose(Solt)*Ft


Xplot = Gain(:,1)
Yplot = Gain(:,2)

plot(Xplot,Yplot, '*' , 13000,4200,  '*')
axis([0,26000,0,25000])

% figure;
% hold on;
% for i = 1:4,
%     p1 = Gain(1, 2);
%     p2 = Gain(1, 3);
%     p3 = Gain(1, 4);
%     p4 = Gain(1, 5); 
%     for j=1:100,
%         a = (j - 1) / 100.0;
%         if i == 1,
%             p1 = a * Gain(2, 2) + (1 - a) * Gain(1, 2);
%             name = 'Resp Atelier';
%             color = [1; 0; 0];
%         elseif i == 2,
%             p2 = a * Gain(3, 3) + (1 - a) * Gain(1, 3);
%             name = 'Resp Stock';
%             color = [0; 1; 0];
%         elseif i == 3,
%             p3 = a * Gain(4, 4) + (1 - a) * Gain(1, 4);
%             name = 'Resp Commercial';
%             color = [0; 0; 1];
%         elseif i == 4,
%             p4 = a * Gain(5, 5) + (1 - a) * Gain(1, 5);
%             name = 'Resp Personnel';
%             color = [0; 0; 0];
%         end
%         X(1, j) = j;
%         [q, B(1, j)] = Partie2Calc(p1, p2, p3, p4);
%     end
%     plot(X, B, 'Color', color, 'DisplayName', name);
% end
% 
% hold off;
% legend('show');

end

