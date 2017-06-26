function [y t] = beuler(f,df,a,b,ya,n)
h = (b - a) / n;
wi = ya;
x = wi;
tn = a;
y(1,:) = ya;
t(1) = a;
for i = 1 : n
    tn = tn + h;
    for k = 1:5 % Few iterations of Newton's method, for simplicity
        % In a more sophisticated implementation, Newton's method should 
        % be stopped depending on how its error compares with an estimated 
        % local truncation error
        x = x - (h * df(tn,x) - 1) \ (h * f(tn,x) - x + wi);
    end;
    wi = x;
    y(i+1,:) = x;
    t(i+1) = tn;
end;