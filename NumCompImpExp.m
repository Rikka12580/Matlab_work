%Explicit Method
f = @(t,x) [77.27*(x(2)+x(1)*(1-8.375*10^-6*x(1)-x(2))); 
    1/77.27*(x(3)-(1+x(1))*x(2)); 
    0.161*(x(1)-x(3))];
%Implicit method
f2 = @(t, x, xp) [xp(1)-(77.27*(x(2)+x(1)*(1-8.375*10^-6*x(1)-x(2)))); 
    xp(2)-(1/77.27*(x(3)-(1+x(1))*x(2)));
    xp(3)-(0.161*(x(1)-x(3)))];
%initial conditions for implicit
x0 = [1;2;3];
xp0 = [0;0;0];

%Solving the systems
[t_imp, x_imp] = ode15i(f2, [0 1], x0, xp0);
[t_exp, x_exp] = ode45(f, [0 1], [1 2 3]);

%The V matrix corresponds to the eigenvalues of x(0), x(1), and x(2)
[S1 V1 D1]=svd(x_imp)
[S V D]=svd(x_exp)
%First three rows of previous matrix, implicit method
V1(1,:)
V1(2,:)
V1(3,:)
%First three rows of previous matrix, explicit method
V(1,:)
V(2,:)
V(3,:)
%Time it takes to run the implicit, and explicit, methods
tim1 = @() ode15i(f2, [0 1], x0, xp0)
tim2 = @() ode45(f, [0 1], [1 2 3])
timeit(tim1)
timeit(tim2)
%Graphs
plot(t_exp, x_exp(:, 1), 'r-+', 'DisplayName', 'x(0)explicit');
hold on
plot(t_exp, x_exp(:, 2), 'r-+','DisplayName','x(1)explicit');
plot(t_exp, x_exp(:, 3), 'r-+','DisplayName','x(2)explicit');
plot(t_imp, x_imp(:, 1), 'g-*', 'DisplayName','x(0)implicit'); 
plot(t_imp, x_imp(:, 2), 'g-*', 'DisplayName','x(1)implicit'); 
plot(t_imp, x_imp(:, 3), 'g-*', 'DisplayName','x(2)implicit');
legend('show')
