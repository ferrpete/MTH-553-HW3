% Problem1_Main.m
% Peter Ferrero, Oregon State University, 4/5/2018, MTH 553 HW1
% A program to calculate Poisson's equation for various boundary condition
% schemes and source terms

n = [10 20 50 100];
a = 0;
b = 1;
T = 0.14;
theta = 1;
N = length(n);
M = length(theta);
k = 1;

h = (b-a)/n(4);
dt = h^2/50;

parameters(1) = 0;
parameters(2) = a;
parameters(3) = b;
parameters(4) = T;
parameters(5) = 0;
parameters(6) = k;
parameters(7) = dt;

for i=1:M
    
    u = cell(N,1);
    x = cell(N,1);
    ue = cell(N,1);
    maxErr = zeros(N,1);
    
    for j=1:N
        
        parameters(1) = n(j);
        parameters(5) = theta(i);
        [h(j),u{j},x{j},Tend,maxErr(j)] = HeatFiniteDifference(parameters);
        ue{j} = Problem1_Exact(x{j},Tend);
        
    end
    
    figure
    loglog(h,h.^2,'k-',h,maxErr,'r*-')
    xlabel('Stepsize, h')
    ylabel('Grid Norm')
    title('Infinity Norm Error for u_t - u_xx = 0')
    legend('Quadratic','L^{\infty}')
    legend('location','southeast')
    axis([-inf,inf,-inf,inf])
    
    alpha = zeros(N-1,1);
    
    for k=1:N-1
        
        alpha(k) = (log(maxErr(k+1))-log(maxErr(k)))/(log(h(k+1))-log(h(k)));
        
    end
    
end