% Problem1_Exact.m
% Peter Ferrero, Oregon State University, 3/13/2018, MTH 552, Homework 8
% A function to calculate the exact solution for Problem 1.

function u = Problem1_Exact(x)

k1 = 1;
k2 = 10;

idx = x < 0.5;
u = zeros(length(x),1);

u(idx) = ((-2*k2)/(k1+k2))*x(idx) + 2;
u(~idx) = ((-2*k1)/(k1+k2))*x(~idx) + ((3*k1+k2)/(k1+k2));

end