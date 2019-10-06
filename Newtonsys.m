function  Xiterations = Newtonsys(FdF,X0,kmax)
%Newtonsys  Solve system f(x) = 0 by Newton's method.
%
%    Xiterations = Newtonsys(FdF,x0,kmax)
%
% F(x) and F'(x) are computed by the user-supplied function FdF with the
% call [F,dF] = FdF(x), where F is a vector holding the computed F(x) and
% dF is a matrix holding the computed F'(x).
%
% The starting point is x0.
% 
% The function carries out kmax iterations, and stores all kmax iterations
% as columns on the output matrix Xiterations.

% Initialization.
X = X0;
[F, dF] = feval(FdF, X);
H = dF\F;  % This is the first step.

% Now iterate.
for k=1:kmax
    X = X - H;
    Xiterations(:,k) = X;
    [F, dF] = feval(FdF, X);
    H = dF\F;
end