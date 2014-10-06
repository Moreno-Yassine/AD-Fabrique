function [ x ] = comptable( A, B )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%Equation 
%5.67A + 12.38B + 12.27C + 1.03D + 31.65E + 27.55F

f = [-5.67; -12.38; -12.27; -1.03; -31.65; -27.55];
lb = [0;0;0;0;0;0];
x = linprog(f, A, B,[],[],lb); 


result = f' * x
end

