clear all
close all
clc
f = @(t,x) [77.27*(x(2)+x(1)*(1-8.375*10^-6*x(1)-x(2))); 
    1/77.27*(x(3)-(1+x(1))*x(2)); 
    0.161*(x(1)-x(3))];
[t,xa] = ode45(f,[0 1],[1 2 3]);
plot(t,xa(:,1),'-'); 
hold on
plot(t,xa(:,2),'-.');
hold on
plot(t,xa(:,3),'.');