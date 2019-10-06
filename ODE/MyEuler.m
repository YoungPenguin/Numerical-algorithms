function [t,x] = MyEuler(dxdt,tspan,x0,n)
%   [t,x] = Eulode(dxdt,tspan,x0,n):
%           uses Euler's method to integrate an ODE
% input:
%   dxdt = function handle to the function returning the rhs of the ODE 
%   tspan = [a, b] where a and b are initial and
%           final values of the independent variable
%   x0 = initial value of dependent variable
%   n = number of steps
% output:
%   t = vector of independent variable
%   x =[x_0 x_1 ... x_n] vector of solution for dependent variable

a = tspan(1);
b = tspan(2);
t = linspace(a,b,n+1); % Dette er bedre end at fremskrive t 
h=(b-a)/n;          % h is calculated once only
x = zeros(1,n+1);   % preallokere x det er hurtigere
x(1,1)=x0;          % lægger x0 som første x-værdi
for i = 1:n         % implementerer Euler's method
  x(1,i+1) = x(1,i) + dxdt(t(i),x(1,i))*h;
end


