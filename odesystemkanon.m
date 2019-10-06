function [ z ] = odesystemkanon( ~, indata )
%% simultaneous second order differentials for projectile
% motion with air resistance
% output vector z has the four differential outputs
% assumed units: metres, seconds, Newtons, kg, radians
% da t som skal v?re f?rste variabel ikke bruges kan 
% den erstattes af ~ i funktionsdeklereringen

g=9.81; % m/s^2
m=550/1000; % mass of projectile, kg
d=0.07; % diameter of spherical projectile, meters
Cd=0.5; % assumed
rho=1.2041; % density of air, kg/m^3
A=pi*d^2/4; % silhouette area, m^2
C=Cd*A*rho/2/m; % the drag force constant
z = zeros(4,1); % initialize space
z(1) = indata(2);
z(2) = -C*sqrt(indata(2)^2 + indata(4)^2)* indata(2);
z(3) = indata (4);
z(4) = -g -C*sqrt(indata(2)^2 + indata(4)^2)* indata(4);
