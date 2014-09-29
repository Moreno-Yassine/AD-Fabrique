function [ x ] = comptable( A, B )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%Equation 
%-73A - 54B - 31C -115D -48E -117F

f = [-73; -54; -31; -115; -48; -117];
x = linprog(f, A, B); 

end

