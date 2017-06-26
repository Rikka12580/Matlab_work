
clear all

x = -2  
Es = 0.1   
Ea = 1000; 
xold = x;   
n = 0;    

while Ea > Es
    x = 1/(exp(x)-x);
    Ea = abs((x-xold)/x)*100;
    xold = x;
    n = n + 1;
    n
    x
end
x  
n  
