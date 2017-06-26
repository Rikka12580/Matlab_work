clear all
close all
clc
f=@(x) (1/3*exp(x)-x)
df=@(x) (1/3*exp(x)-1)
a=0; 
b=20;
x=a;
for i=1:1:100
    x1=x-(f(x)/df(x));
    x=x1;
end
sol=x;
fprintf('Approximate Root is %.15f',sol)
