clear all
close all
f1 = @(t,y) (1.36-(exp(-y)));
f2 =
f3 = 
h = 1;
tx = 100;
t = 50:h:tx;
y = zeros(1,numel(t));
y(1) = 0;
for i = 2:numel(t)
    k1 = h*f1(t(i-1),y(i-1));
    k2 = h*f1(t(i-1)+h/2, y(i-1)+k1/2);
    k3 = h*f1(t(i-1)+h/2, y(i-1)+k2/2);
    k4 = h*f1(t(i-1)+h, y(i-1)+k3);
    y(i) = (y(i-1) + (k1+2*k2+2*k3+k4)/6);
    disp([t(i) y(i)]);
end


plot (t, y);
%hline = refline([0,4.7104])
title('Runge-Kutta 4th Order Approximation for 1/(1exp(x)-x)')
xlabel('t')
ylabel('y(i)')