f = @(t,y) (1/(exp(y) - y));
h = 1;
tx = 50;
t = 0:h:tx;
y = zeros(1,numel(t));
y(1) = 0;
for i = 2:numel(t)
    k1 = h*f(t(i-1),y(i-1));
    k2 = h*f(t(i-1)+h/2, y(i-1)+k1/2);
    k3 = h*f(t(i-1)+h/2, y(i-1)+k2/2);
    k4 = h*f(t(i-1)+h, y(i-1)+k3);
    y(i) = (y(i-1) + (k1+2*k2+2*k3+k4)/6);
    disp([t(i) y(i)]);
end

plot (t, y);