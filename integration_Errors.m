%% Define problem
clear; clc; 
a           = 0;        % Lower integration limit
b           = 4;        % Upper integration limit
M           = 8*exp(4);        % Max derivative f''(xi) or f''''(xi).
error_Max   = 10^(-4);  % Max desired error
N           = 0;        % Set this nonzero.

%% Trapezoid
h   = b - a;
e_T = 1/12 * h^3 * M;

%% Repeated Trapezoid
n_RT = ceil(sqrt( M * (b - a)^3 / (12*error_Max)));

if N ~= 0
    h       = (b - a)/N;
    e_RT    =  h^2 * (b - a)/12 * M;
else 
    e_RT = NaN;
end

%% Simpsons 1/3
h   = (b - a)/2;
e_S = h^4 * M * (b - a)/180;

%% Repeated Simpsons 1/3
n_RS = ( M * (b - a)^5  /  (180*error_Max)  )^(1/4);
% Needs to be an equal number!
if mod(n_RS, 2) ~= 0
    n_RS = n_RS - mod(n_RS, 2) + 2;
end

if N ~= 0 
    h       = (b - a)/N;
    e_RS    = (b - a) * M * h^4 / 180; 
else 
    e_RS = NaN;
end

%% Print out
Methods     = {'Trapez'; 'Repeated Trapez'; 'Simpsons'; 'Repeated Simpsons'};
MaxErrors   = [e_T; e_RT; e_S; e_RS];
Iterations  = [NaN; n_RT; NaN; n_RS];
T           = table(Methods, MaxErrors,Iterations);
disp(T)