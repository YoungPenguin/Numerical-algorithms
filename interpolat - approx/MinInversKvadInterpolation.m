function [ X, fX ] = MinInversKvadInterpolation( f, x, n )
%MinInverKvadInterpolation udfører n iterationer af invers
%   kvadratisk interpolation for
%   f function handtreel
%   x=[x0, x1, x2] er de  initiale x-værdier
%   n er antallet af iterationer
%   MinInverKvadInterpolation returnerer en vektor X med alle n estimater
%   af roden

fX=zeros(1,n+3);
X=zeros(1,n+3);
X(1,1:3)=x;
for i=1:3
    fX(1,i)=f(x(1,i));
end
for i=1:n
    X(1,i+3)=LagrangeFormInterpolation(fX(1,i:i+2),X(1,i:i+2),0);
    fX(1,i+3)=f(X(1,i+3));
end
X=X(1,4:end);
fX=fX(1,4:end);


