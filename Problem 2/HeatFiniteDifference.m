% HeatFiniteDifference.m
% Peter Ferrero, Oregon State University, 5/5/2018, MTH 553 HW3
% A function to compute the finite difference for the heat equation.

function [h, u, x, T, maxErr] = HeatFiniteDifference(parameters)

    n = parameters(1);
    a = parameters(2);
    b = parameters(3);
    T = parameters(4);
    theta = parameters(5);
    dt = parameters(7);

    x = [linspace(a,b,n+1)]';
    h = x(2)-x(1);
    xm12 = [-h/2:h:b-h/2]';
    xp12 = [h/2:h:b+h/2]';
    t = [0:dt:T]';
    
    km12 = Problem1_K(xm12);
    kp12 = Problem1_K(xp12);
    A = Problem1_Amatrix(n+1,h,dt,theta,km12,kp12);
    B = Problem1_Bmatrix(n+1,h,dt,theta,km12,kp12);
    u0 = Problem1_U0(x);
    
    F = B*u0;
    F = Problem1_BC(F);
    
    N = length(t);
    
    midErr = 1;
    T = dt;
    
    while midErr > 0.01
    
        u = A\F;
        
        F = B*u;
        F = Problem1_BC(F);
        midErr = abs(u(ceil(end/2)) - Problem1_Exact(x(ceil(end/2))));
        T = T + dt;
        
        plot(x,u,'k-')
        pause(0.005)
        
    end
    
    maxErr = max(abs(u-Problem1_Exact(x)));

end