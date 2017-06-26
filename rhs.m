function dudt = rhs(u,t)
dudt = [(3*u(1) + 2*u(2) - (2*t^2 + 1)*exp(2*t));
        (4*u(1) + u(2) + (t^2 + 2*t - 4)*exp(2*t))];