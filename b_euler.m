f=inline('sin(y*t)','t','y');
df=inline('t*cos(y*t)','t','y');
h = (b - a) / n;
wi = ya;
x = wi;
tn = a;
y(1,:) = ya;
t(1) = a;
for i = 1 : n
    tn = tn + h;
    for k = 1:5 
        x = x - (h * df(tn,x) - 1) \ (h * f(tn,x) - x + wi);
    end;
    wi = x;
    y(i+1,:) = x;
    t(i+1) = tn;
end;
       

y=beuler(f,df,0,1,1,10);
