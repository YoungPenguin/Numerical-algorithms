function X = bisektion(f,a,b,nmax)
%BISEKTION  Bisektion til beregning af et nulpunkt.
%
%   X = bisektion(f,a,b,nmax)
%
% Løser f(x)=0 med bisektion, med startinterval [a,b] og med nmax iterationer.
%
% Input:  f    = funktion der beregner f(x)
%         a    = nedre grænse for startinterval
%         b    = øvre grænse for startinterval
%         nmax = antal iterationer
%
% Output: X    = vektor med alle iterationerne
% Check input.
if nmax < 1, error('nmax skal være et positivt tal'), end

% Gør klar til at iterere.
if a>=b, error('Der skal gælde a < b'), end
fa = f(a);
fb = f(b);
if fa*fb > 0, error('f(a) og f(b) skal have forskellige fortegn'), end
X = zeros(nmax+1,1);  % Opret X hvor iterationer lagres.

% Iteration.
for n=1:nmax
    c = (a+b)/2;   % Midtpunktet.
    fc = f(c);     % Den tilsvarende funktionsværdi.
    X(n) = c;
    if fa*fc < 0
        b = c;
        % fb = fc;   Bemærk at fb = f(b) faktisk ikke bruges.
    else
        a = c;
        fa = fc;
    end
end

% Afslut med at beregne midtpunktet i det sidste interval.
c = (a+b)/2;
X(nmax+1) = c;