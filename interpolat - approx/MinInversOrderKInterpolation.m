function [ X, fX ] = MinInversOrderKInterpolation( f, x, n )
%UNTITLED MinInverKvadInterpolation udfører n iterationer af invers
%kvadratisk interpolation for
%   f function handel
%   x=[x1,..,xk] er de k initiale x-værdier
%   n er antallet af iterationer
%   MinInverKvadInterpolation returnerer en vektor X med alle n estimater
%   af roden

k=length(x);
fX=zeros(1,n+k);
X=zeros(1,n+k);
X(1,1:k)=x;
for i=1:k
    fX(1,i)=f(x(1,i));
end
for i=1:n
    X(1,i+k)=LagrangeFormInterpolation(fX(1,i:i+k-1),X(1,i:i+k-1),0);
    fX(1,i+k)=f(X(1,i+k));
end
X=X(1,k+1:end);
fX=fX(1,k+1:end);


