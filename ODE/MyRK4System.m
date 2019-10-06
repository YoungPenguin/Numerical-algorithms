function [t,x] = MyRK4System(dxdt,tspan,x0,n)
% [t,x] = MyMyRK4System(dxdt,tspan,x0,n):
%   uses the classical fourth order Runge-Kutta method (e.g. page 314 in
%   Numerical Math. and Computing 7'ed , Cheney and Kincaid ) to 
%   integrate an ODE
% input:
%   dxdt = XXX evaluates the ODE 
%   tspan = [a, b] where a and b = initial and
%           final values of independent variable
%   x0 = initial column vector value of dependent variable
%   n = number of stemp
% output:
%   t = vector of independent variable
%   x = [x_0 x_1 ... x_n] matrix of solution for 
%                         dependent column vector variable

dim1=size(x0,1);
dim2=size(dxdt(tspan(1),x0),1);  % lidt spild, men kan gemmes
if dim1-dim2~=0
    error('Dimensionerne af x0 of højresiden passer ikke sammen'); 
end

a = tspan(1);
b = tspan(2);
t = (linspace(a,b,n+1))';
h=(b-a)/n;
hhalve=h/2.0;
hbysix=h/6.0;
x=zeros(dim1,n+1);   % preallocate x to improve efficiency
x(:,1)=x0;
for i = 1:n  %implement the method
    K1=dxdt(t(i),x(:,i));
    K2=dxdt(t(i)+hhalve,x(:,i)+hhalve*K1);
    K3=dxdt(t(i)+hhalve,x(:,i)+hhalve*K2);
    K4=dxdt(t(i+1),x(:,i)+h*K3);
    x(:,i+1) = x(:,i) + hbysix*(K1+ 2*(K2+K3)+K4);
end

