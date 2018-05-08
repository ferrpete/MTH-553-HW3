% Problem1_Exact.m
% Peter Ferrero, Oregon State University, 3/13/2018, MTH 552, Homework 8
% A function to calculate the exact solution for Problem 1.

function u = Problem1_Exact(x,T)

u = exp(-pi^2*T)*sin(pi*x);

end