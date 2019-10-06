function [t,x] = MyTaylorOrder2(f,df,tspan,x0,n)
% [t,y] = MyTaylorOrder2(f,df,tspan,y0,n):
%    uses the Taylor series method to integrate an ODE
% input:
%     f  = function fandle to the rhs. of the ODE 
%     df = function fandle to the time derivative of the rhs.
%  tspan = [ti, tf] where ti and tf = initial and
%           final values of independent variable
%     x0 = initial value of dependent variable
%      n = number of steps
% output:
%      t = vector of independent variable
%      x = vector of solution for dependent variable

ti = tspan(1);
tf = tspan(2);
t=linspace(ti,tf,n+1);
x = zeros(1,n+1);   % prealokere x det er hurtigere
x(1,1)=x0; h=(tf-ti)/n;
for i = 1:n  
    dx=f(t(i),x(1,i));
    ddx=df(t(i),x(1,i),dx);
    x(1,i+1) = x(1,i) + h*(dx+h/2*(ddx));
end

