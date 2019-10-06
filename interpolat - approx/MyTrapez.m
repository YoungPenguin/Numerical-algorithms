function [ S ] = MyTrapez( f,a,b,n )
%MyTrapez calculation of the Trapezformula for 
%Input
%   f: function to be integrated; 
%      f is not assumed vectorized and is called in each x-value seperately
%   a: lower integration boundary
%   b: upper integration boundary
%   n: the number of intervals
%Output 
%   The value of the trapezformula

x=linspace(a,b,n+1);
S=f(x(1))/2.0;
for i=2:n
    S=S+f(x(i));
end
S=S+f(x(n+1))/2.0;
S=S*(b-a)/n;
end

