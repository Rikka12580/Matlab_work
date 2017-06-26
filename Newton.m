x = -2;
x_old = 2;
x_true = 0.0623776;
iter = 0;
while abs(x_old-x) > 10^-4
    x_old = x;
    x = x - (x+exp(x))/(exp(x)+1);
    iter = iter + 1;
    fprintf('Iteration %d: x=%.20f, err=%.20f\n', iter, x, x_true-x);
    pause;
end