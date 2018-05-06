% Problem1_Bmatrix.m
% Peter Ferrero, Oregon State University, 5/5/2018, MTH 553, Homework 3
% A function to calculate the matrix B.

function B = Problem1_Bmatrix(n_interior,h,dt,theta)

row_ndx = [2:n_interior, 1:n_interior, 1:n_interior-1]';
col_ndx = [1:n_interior-1, 1:n_interior, 2:n_interior]';

values = zeros(n_interior+2*(n_interior-1),1);

% interior points

values(1:n_interior-1) = (1-theta)*(dt/(h^2));
values(n_interior:2*n_interior-1) = 1 - 2*(1-theta)*(dt/(h^2));
values(2*n_interior:3*n_interior-2) = (1-theta)*(dt/(h^2));

% dirichlet boundary conditions

values(2*n_interior) = 0;
values(n_interior) = 1;
values(2*n_interior-1) = 1;
values(n_interior-1) = 0;

B = sparse(row_ndx,col_ndx,values);

end