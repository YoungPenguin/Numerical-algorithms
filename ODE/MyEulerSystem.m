function [t,x] = MyEulerSystem(dxdt,tspan,x0,n)
% [t,x] = Eulode(dydt,tspan,x0,n):
%         uses Euler's method to integrate an ODE system
% input:
%   dxdt = function handle to the function returning the rhs of the ODE 
%   tspan = [a, b] where a and b = initial and
%           final values of independent variable
%   x0 = initial value of dependent (collumn vector)-variable
%   n = number of steps
% output:
%   t = vector of independent variable
%   x = [x(t_0) x(t_1) ...x(t_n)] matrix of solution for dependent variable


dim1=size(x0,1);
dim2=size(dxdt(tspan(1),x0),1);  % lidt spild, men kan gemmes
if dim1-dim2~=0 
    error('Dimensionerne af x0 of højresiden passer ikke sammen');
end

a = tspan(1);
b = tspan(2);
t = (linspace(a,b,n+1))';
h=(b-a)/n;                   % h is calculated once only
x = zeros(dim1,n+1);         % preallocate x to improve efficiency
x(:,1)=x0;
for i = 1:n                  % Euler's method
  x(:,i+1) = x(:,i) + dxdt(t(i),x(:,i))*h;
end

