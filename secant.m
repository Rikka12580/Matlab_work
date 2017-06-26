eps_step = 1e-4;
eps_abs = 1e-4;
N = 100;
xp = -2;
xc = 2;

for i=1:N
    xn = (xc*(x+exp(xp)) - xp*(x+exp(xc)))/(x+exp(xp)) - (x+exp(xc));

    if abs( xc - xn ) < eps_step && abs( cos( xn ) ) < eps_abs
       break;
       elseifd i == N
       error( 'the secant method did not converge' );
    end

    xp = xc;
    xc = xn;
end

xn