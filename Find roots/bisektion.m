function X = bisektion(f,a,b,nmax)
%BISEKTION  Bisektion til beregning af et nulpunkt.
%
%   X = bisektion(f,a,b,nmax)
%
% L�ser f(x)=0 med bisektion, med startinterval [a,b] og med nmax iterationer.
%
% Input:  f    = funktion der beregner f(x)
%         a    = nedre gr�nse for startinterval
%         b    = �vre gr�nse for startinterval
%         nmax = antal iterationer
%
% Output: X    = vektor med alle iterationerne
% Check input.
if nmax < 1, error('nmax skal v�re et positivt tal'), end

% G�r klar til at iterere.
if a>=b, error('Der skal g�lde a < b'), end
fa = f(a);
fb = f(b);
if fa*fb > 0, error('f(a) og f(b) skal have forskellige fortegn'), end
X = zeros(nmax+1,1);  % Opret X hvor iterationer lagres.

% Iteration.
for n=1:nmax
    c = (a+b)/2;   % Midtpunktet.
    fc = f(c);     % Den tilsvarende funktionsv�rdi.
    X(n) = c;
    if fa*fc < 0
        b = c;
        % fb = fc;   Bem�rk at fb = f(b) faktisk ikke bruges.
    else
        a = c;
        fa = fc;
    end
end

% Afslut med at beregne midtpunktet i det sidste interval.
c = (a+b)/2;
X(nmax+1) = c;