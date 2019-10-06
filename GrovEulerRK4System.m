function tmp()
% Matlabkoden er lavet som en function fordi det s� er 
% muligt at have deklareringen af hj�lpefunktionerne i den samme fil
close all, clear all, clc, format compact, format short

tspan=[0 2*pi];
X0=[1;0];                         % jeg har valgt at z er en s�jlevektor
n=10;
hRK4=(tspan(2)-tspan(1))/n           % Jeg har ikke brug for h, men vil gerne
hEuler=(tspan(2)-tspan(1))/n/4                                % se den aligevel
[t,Xt] = MyEulerSystem(@odefun,tspan,X0,4*n);
[tRK4,XRK4]=MyRK4System(@odefun,tspan,X0,n);
[t2,X45] = ode45(@odefun,tspan,X0);     % her kaldes Matlabs adaptive
                                        % Runge-Kutta 45 metode
X45=X45';                               % ode45 l�gger punkterne i r�kker,
                                        % s� det laver jeg om til s�jler
figure
plot(t,Xt,t2,X45,tRK4,XRK4);
legend('(t,x_1(t)) Euler','(t,x_2(t)) Euler','(t,x_1(t)) ode45',...
       '(t,x_2(t)) ode45','(t,x_1(t)) RK4',...
       '(t,x_2(t)) RK4', 'Location','SouthWest')
figure
hold on
plot(Xt(1,:),Xt(2,:),X45(1,:),X45(2,:),XRK4(1,:),XRK4(2,:))
axis equal
legend('( x_1(t),x_2(t) ) Euler','( x_1(t),x_2(t) ) ode45',...
       '( x_1(t),x_2(t) ) RK4', 'Location','Best')

function dzdt = odefun(t,X)   % NB: L�seren kr�ver at funktionen er en 
                              %     funktion af (t , X-s�jlevektor)
                              %     og at ersultatet er en s�jlevektor.
                              %     S� det f�r den (-:
dzdt=[-X(2,1);...
       X(1,1)];
