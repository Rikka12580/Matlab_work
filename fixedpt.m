% Finding the nontrivial root of 
% f(x) = sin(x) - x^2
% using the Simple Fixed-Point Iteration

clear all

x = -2   %initial guess
Es = 0.1    %tolerance
Ea = 1000;  %randomly large relative approximate error
xold = x;   
n = 0;      %iteration counter

while Ea > Es
    x = 1/(exp(x)-x);
    Ea = abs((x-xold)/x)*100;
    xold = x;
    n = n + 1;
    n
    x
end
x  %the root
n   %number of iterations