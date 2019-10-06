function [t,x] = MyRK4(dxdt,tspan,x0,n)
% [t,x] = MyRK4(dydt,tspan,x0,n):
%   uses the classical fourth order Runge-Kutta method to 
%   integrate an ODE
% input:
%   dydt = name of the M-file that evaluates the ODE 
%   tspan = [a, b] where a and b = initial and
%           final values of independent variable
%   x0 = initial value of dependent variable
%   n = number of stemp
% output:
%   t = vector of independent variable
%   x = vector of solution for dependent variable

a = tspan(1);
b = tspan(2);
t = (linspace(a,b,n+1))';
h=(b-a)/n;
hhalve=h/2.0;
hbysix=h/6.0;
x = x0*ones(n+1,1); %preallocate x to improve efficiency
for i = 1:n  %implement the method
    K1=dxdt(t(i),x(i));
    K2=dxdt(t(i)+hhalve,x(i)+hhalve*K1);
    K3=dxdt(t(i)+hhalve,x(i)+hhalve*K2);
    K4=dxdt(t(i+1),x(i)+h*K3); %undgå t(i)+h
    x(i+1) = x(i) + hbysix*(K1+ 2*(K2+K3)+K4);
end

