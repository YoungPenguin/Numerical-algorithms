function X = Newton(f,df,x0,nmax)
%NEWTON  Implementering af Newtons metode.
%
%   X = Newton(f,df,x0,nmax)
%
% Løser f(x)=0 med Newtons metode, med startgæt x0 og med nmax iterioner.
%
% Input:  f    = funktion der beregner f(x)
%         df   = funktion der beregner f'(x)
%         x0   = startgæt
%         nmax = antal iterationer
%
% Output: X    = vektor med alle iterationerne
n = 0;
x = x0;
X = zeros(nmax+1,1);
X(1) = x;
for n=1:nmax
    fx = f(x);
    fp = df(x);
    x = x - fx/fp;
    X(n+1) = x;
end