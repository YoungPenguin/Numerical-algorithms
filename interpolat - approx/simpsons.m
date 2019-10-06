function S = simpsons(f, a, b, n)

if(mod(n,2)~=0)
    disp('error n need to be even number');
    S = NaN; 
    return;
end

x = linspace(a, b, n+1);
S = 0;
r = [1 repmat([4,2], 1, (n/2)-1) 4 1];

for i = 1:n+1
    S = S + f(x(i))*r(i);
end 
S = S*((b-a)/n)/3;
end