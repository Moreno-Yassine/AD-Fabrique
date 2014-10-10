function [x] = respAtelier( A,B )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%équation
%f(a,b,c,d,e,f) = a+b+c+d+e+f (maximiser)

f = [-1; -1; -1; -1; -1; -1];
lb = [0;0;0;0;0;0];
x = linprog(f, A, B,[],[],lb,[]); 

Result = -f'*x
end

