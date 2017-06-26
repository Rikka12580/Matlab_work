syms x x4 x5 x0 f0 f4 f5
a = (f0*(x^2-x*x5-x*x4+x4*x5)/(x0^2-x0*x5-x0*x4+x4*x5))
b = (f4*(x^2-x*x5-x*x0+x0*x5)/(x4^2-x4*x5-x0*x4+x0*x5))
c = (f5*(x^2-x*x4-x*x0+x0*x4)/(x5^2-x4*x5-x0*x5+x0*x4))
simplify(a+b+c)
