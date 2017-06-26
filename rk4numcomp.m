%% ODE solving
% Here is the system of ODEs we want to solve:
%
% y1' = y2-y1+t
%
% y2' = 2*sin(t)*y2
%
% y1(0) = y2(0) = 1;
%
% This can be converted to:
%
% Y = [y1; y2];
%
% Y' = [y(2)-y(1)+t; 2*sin(t)*y(2)];

%% Solve using ODE45
% Define the ODE function
f = @(t,x) [77.27*(x(2)+x(1)*(1-8.375*10^-6*x(1)-x(2))); 
    1/77.27*(x(3)-(1+x(1))*x(2)); 
    0.161*(x(1)-x(3))];
% Solve over the interval [0, 10]
[t45, x45] = ode45(f, [0 1], [1 2 3]);

% Plot y1 and y2
plot(t45, x45(:, 1), '-', t45, x45(:, 2), '+', t45, x45(:, 3), '*');

%% Solve using ODE15I
% Define the ODE function
%
% If Y' = [y(2)-y(1)+t; 2*sin(t)*y(2)]
%
% and Y' = [yp(1); yp(2)], then
%
% 0 = [yp(1)-y(2)-y(1)-t; yp(2)-2*sin(t)*y(2)]
f2 = @(t,x) [77.27*(x(2)+x(1)*(1-8.375*10^-6*x(1)-x(2))); 
    1/77.27*(x(3)-(1+x(1))*x(2))];
y0 = [1;2;3];
yp0 = [1;2;3];
% Solve over the interval [0 1]
[t15i, x15i] = ode15i(f2, [0 1], y0, yp0);

% Plot y1 and y2
plot(t15i, x15i(:, 1), 'r-o', t15i, x15i(:, 2), 'g-+', t15i, x15i(:, 3), 'g-+');
