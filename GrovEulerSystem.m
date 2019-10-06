function tmpPR()
% Matlabkoden er lavet som en function fordi det så er 
% muligt at have deklareringen af hjælpefunktionerne i den samme fil
close all, clear all, clc, format compact, format short

tspan=[0 2*pi];
X0=[1;0];                         % jeg har valgt at z er en søjlevektor
n=100;
h=(tspan(2)-tspan(1))/n           % Jeg har ikke brug for h, men vil gerne
                                  % se den aligevel
[t,Xt] = MyEulerSystem(@odefun,tspan,X0,n);
[t2,X45] = ode45(@odefun,tspan,X0);     % her kaldes Matlabs adaptive
                                        % Runge-Kutta 45 metode
X45=X45';                               % ode45 lægger punkterne i rækker,
                                        % så det laver jeg om til søjler
figure
plot(t,Xt,t2,X45);
legend('(t,x_1(t)) Euler','(t,x_2(t)) Euler','(t,x_1(t)) ode45',...
       '(t,x_2(t)) ode45', 'Location','SouthWest')
figure
hold on
plot(Xt(1,:),Xt(2,:),X45(1,:),X45(2,:))
axis equal
legend('( x_1(t),x_2(t) ) Euler','( x_1(t),x_2(t) ) ode45', 'Location','Best')

function dzdt = odefun(t,X)   % NB: Løseren kræver at funktionen er en 
                              %     funktion af (t , X-søjlevektor)
                              %     og at ersultatet er en søjlevektor.
                              %     Så det får den (-:
dzdt=[-X(2,1);...
       X(1,1)];
