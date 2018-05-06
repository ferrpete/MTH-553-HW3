% HeatFiniteDifference.m
% Peter Ferrero, Oregon State University, 5/5/2018, MTH 553 HW3
% A function to compute the finite difference for the heat equation.

function [h, u, x, T] = HeatFiniteDifference(parameters)

    n = parameters(1);
    a = parameters(2);
    b = parameters(3);
    T = parameters(4);
    theta = parameters(5);
    dt = parameters(7);

    x = [linspace(a,b,n+1)]';
    h = x(2)-x(1);
    t = [0:dt:T]';
    
    A = Problem1_Amatrix(n+1,h,dt,theta);
    B = Problem1_Bmatrix(n+1,h,dt,theta);
    f = Problem1_F(x,dt);
    u0 = Problem1_U0(x);
    u0 = Problem1_BC(u0);
    
    F = B*u0;
    
    N = length(t);
    
    
    
    for i = 1:N-1
    
        u = A\F;
        
        u = Problem1_BC(u);
        F = B*u;
        
%         plot(x,u,'k-')
%         axis([0,1,0,1.1])
%         pause(0.5)
        
    end
    
    T = t(end);

end