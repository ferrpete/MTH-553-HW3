% Problem1_Amatrix.m
% Peter Ferrero, Oregon State University, 5/5/2018, MTH 553, Homework 3
% A function to calculate the matrix A.

function A = Problem1_Amatrix(n_interior,h,dt,theta,km,kp)

row_ndx = [2:n_interior, 1:n_interior, 1:n_interior-1]';
col_ndx = [1:n_interior-1, 1:n_interior, 2:n_interior]';

values = zeros(n_interior+2*(n_interior-1),1);

% interior points

values(1:n_interior-1) = -km(2:end)*theta*(dt/(h^2));
values(n_interior:2*n_interior-1) = 1 + km*theta*(dt/(h^2)) + kp*theta*(dt/(h^2));
values(2*n_interior:3*n_interior-2) = -kp(1:end-1)*theta*(dt/(h^2));

% dirichlet boundary conditions

values(2*n_interior) = 0;
values(n_interior) = 1;
values(2*n_interior-1) = 1;
values(n_interior-1) = 0;

A = sparse(row_ndx,col_ndx,values);

end