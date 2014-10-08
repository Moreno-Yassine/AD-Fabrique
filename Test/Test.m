function[x] = Test()
A = [ 1 1;
    2 1;
    1 0;
    0 1];
B = [800;1000;400;700];

lb = [0;0];


f1 = [-20;-15];
x1 = linprog(f1,A,B,[],[],lb,[]);

f2=[-10;-1];
x2 = linprog(f2,A,B,[],[],lb,[]);


%Calcul Matrice de Gain 
F = [f1 f2];
X = [x1 x2];
Gain = -X'*F


Xplot = Gain(:,1)
Yplot = Gain(:,2)
hold on
plot(Xplot,Yplot, '*' , 13000,4200,  '*')
axis([0,16000,0,5000])

%Degradation de la solution a la main 
%Nouvelles contraintes 
A = [ 1 1;
    2 1;
    1 0;
    0 1
    -10 -1];
B = [800;1000;400;700;-3600];
lb = [0;0];

f3 = [-20;-15];
x3 = linprog(f3,A,B,[],[],lb,[])


%Calcul Matrice de Gain 
F = [f3 f2];
X = [x3 x2];
Gain = -X'*F


Xplot = Gain(:,1)
Yplot = Gain(:,2)

plot(Xplot,Yplot, '*' , 13000,4200,  '*')
axis([0,16000,0,5000])

hold off
end