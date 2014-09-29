function [ x ] = stock( A, B )
% Minimiser f = 5*a + 5*b +6*c + 10*d + 5*e +4*f

f = [5; 5; 6; 10; 5; 4];
lb = [0;0;0;0;0;0];
x = linprog(f, A, B,[],[],lb,[]);

end

