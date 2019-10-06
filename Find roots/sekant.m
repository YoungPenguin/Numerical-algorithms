function X = sekant(f,x0,x1,nmax)
%SEKANT  Sekantmetoden til beregning af et nulpunkt.
%
%   X = sekant(f,x0,x1,nmax)
%
% L�ser f(x)=0 med sekantmetoden, med startg�t x0 og x1 og med nmax iterioner.
%
% Input:  f    = funktion der beregner f(x)
%         x0   = det ene startg�t
%         x1   = det andet startg�t
%         nmax = antal iterationer
%
% Output: X    = vektor med alle iterationerne
% Initialization.
a = x0;
b = x1;
fa = f(a);
fb = f(b);
X = zeros(nmax+1,1);
X(1) = a;
X(2) = b;

% Iteration.
for n=2:nmax
    d = fb*(b-a)/(fb-fa);
    a = b;
    fa = fb;
    b = b - d;
    fb = f(b);
    X(n+1) = b;
end