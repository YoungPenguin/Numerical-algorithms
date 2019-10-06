function p=MyHorner(a,x)
m=length(a);
p=a(m);
for i=m-1:-1:1
    p=a(i)+p*x;
end