function [t,x] = MyHeun(dxdt,tspan,x0,n)
% [t,x] = MyHeun(dxdt,tspan,x0,n):
%   uses Heun's method to integrate an ODE
% input:
%   dydt = function handle to the rhs. of the ODE 
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
hhalve=h/2.0;       % beregner kun h/2 én gang
x = zeros(1,n+1);   % preallokere x det er hurtigere
x(1,1)=x0;          % lægger x0 som første x-værdi
for i = 1:n         % Heun's method
    K1=dxdt(t(i), x(1,i));
    K2=dxdt(t(i+1), x(1,i)+h*K1);
    x(1,i+1) = x(1,i) + (K2+K1)*hhalve;
end

