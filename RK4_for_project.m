y0=0;
h=0.5;
t=0:h:20;
%yexact=3*exp(-2*t)
yx=zeros(size(t));
yx(1)=y0;
for i=1: (length(t)-1)
    k1=(1/(exp(i)-i))
    y1=yx(i)+k1*h/2;
    k2=(1/(exp(y1)-y1))
    y2=yx(i)+k2*h/2;
    k3=(1/(exp(y2)-y2))
    y3=yx(i)+k3*h;
    k4=1/((exp(y3)-y3))
    yx(i+1)=(yx(i))+(k1+2*k2+2*k3+k4)/6;
    yx
end
display([t;yx])
plot(yx, t);
%hline = refline([0,4.5504])