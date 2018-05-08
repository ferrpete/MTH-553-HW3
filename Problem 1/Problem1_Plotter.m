% Problem1_Plotter.m
% Peter Ferrero, Oregon State University, 3/13/2018, MTH 552, Homework 8
% A function to calculate the convergence plots for Problem 1.

function Problem1_Plotter(h,u,ue,x)

N = length(h);

for i=1:N

    MaxError(i) = max(abs(u{i}-ue{i}));
    
end

figure
loglog(h,h.^2,'k-',h,MaxError,'r*-')
xlabel('Stepsize, h')
ylabel('Grid Norm')
title('Infinity Norm Error for u_t - u_xx = 0')
legend('Quadratic','L^{\infty}')
legend('location','southeast')
axis([-inf,inf,-inf,inf])

end