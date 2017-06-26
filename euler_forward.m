function [t,x] = euler_forward(f,xinit,tinit,xfinal,n)
% Euler approximation for ODE initial value problem
% Euler forward method
% File prepared by David Houcque - Northwestern U. 5/11/2005
% Calculation of h from xinit, xfinal, and n
h=(xfinal-xinit)/n;
% Initialization of x and y as column vectors
x=[xinit zeros(1,n)]; t=[tinit zeros(1,n)];
% Calculation of x and y
for i=1:n
x(i+1)=x(i)+h;
t(i+1)=t(i)+h*f(x(i),t(i));
end


end

