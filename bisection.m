f=@(x) 1/(exp(x)-x);
e=0.0001;
a=1;
b=100;
i=0
while (abs(c-a)>=e)
    i=i+1;
    c=(a+b)/2;
    if f(c)>0
        b=c;
    else a=c;
      fprintf('a is %f',a)
      fprintf('b is %f',b)
      fprintf('c is %f',c)
    end
end
 fprintf('Root of given equation is %f',c)