clear all
close all
clc
f = @(t,y) (1/(exp(y) - y));
h = 0.1;
tx = 20;
t = 0:h:tx;
y(1) = 0.0;
for i = 2:numel(t)
    k1 = h*f(t(i-1),y(i-1));
    k2 = h*f(t(i-1)+h/2.0, y(i-1)+k1/2.0);
    k3 = h*f(t(i-1)+h/2.0, y(i-1)+k2/2.0);
    k4 = h*f(t(i-1)+h, y(i-1)+k3);
    y(i) = (y(i-1) + (k1+2*k2+2*k3+k4)/6.0);
    disp([t(i) y(i)]);
end
figure
plot (t, y);
hold on;
%ezplot ('y = x');
%ezplot('(-1/2)*(exp((-2*x)/3) - 1)',[0 20 0 1])
%legend('(1/3*exp(y) - y)','(-1/2)*(exp((-2*x)/3) - 1)')
title('Runge-Kutta 4th Order Approximation for [delta*(exp(x)-x)]: Fizzle Portion')
%line(xlim,[0.619061286 0.619061286],'Color','r')
grid on
xlabel('t')
ylabel('y(i)')