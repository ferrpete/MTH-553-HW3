% Problem1_F.m
% Peter Ferrero, Oregon State University, 3/13/2018, MTH 552, Homework 8
% A function to calculate the source function f for Problem 1.

function k = Problem1_K(x)

idx = x < 0.5;
k = zeros(length(x),1);

k(idx) = 1;
k(~idx) = 10;

end