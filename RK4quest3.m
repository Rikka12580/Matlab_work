f = @(t2,y2) (96.97-(1/exp(y)));
h = 1;
tx2 = 10;
t2 = 0:h:tx2;
y2 = zeros(1,numel(t2));
y2(1) = 0;
for i = 2:numel(t2)
    k11 = h*f(t2(i-1),y2(i-1));
    k22 = h*f2(t2(i-1)+h/2, y2(i-1)+k11/2);
    k33 = h*f2(t2(i-1)+h/2, y2(i-1)+k22/2);
    k44 = h*f2(t2(i-1)+h, y2(i-1)+k33);
    y2(i) = (y2(i-1) + (k11+2*k22+2*k33+k44)/6);
    disp([t2(i) y2(i)]);
end

plot (y2, t2);
