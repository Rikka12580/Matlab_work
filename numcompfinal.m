clc;                                              
clear all;

h = 0.1;                                             
t = 0:h:1;                                     
x = zeros(1,length(t));
y = zeros(1,length(t)); 
z = zeros(1,length(t));

x(1) = 1;
y(1) = 2;                                         
z(1) = 3;                                         
   
F_xyz = @(x,y,z) 77.27*(y+x*(1-8.375*10^-6*x-y));                                 
G_xyz = @(x,y,z) 1/77.27*(z-(1+x)*y);
H_xyz = @(x,y,z) 0.161*(x-z);

for i=1:(length(t)-1)                           
    k_1 = F_xyz(x(i),y(i),z(i));
    l_1 = G_xyz(x(i),y(i),z(i));
    m_1 = H_xyz(x(i),y(i),z(i));
    
    k_2 = F_xyz(x(i)+0.5*h,y(i)+0.5*h*k_1,z(i)+0.5*h*l_1);
    l_2 = G_xyz(x(i)+0.5*h,y(i)+0.5*h*k_1,z(i)+0.5*h*l_1);
    m_2 = H_xyz(x(i)+0.5*h,y(i)+0.5*h*k_1,z(i)+0.5*h*l_1);
    
    k_3 = F_xyz((x(i)+0.5*h),(y(i)+0.5*h*k_2),(z(i)+0.5*h*l_2));
    l_3 = G_xyz((x(i)+0.5*h),(y(i)+0.5*h*k_2),(z(i)+0.5*h*l_2));
    m_3 = H_xyz((x(i)+0.5*h),(y(i)+0.5*h*k_2),(z(i)+0.5*h*l_2));
    
    k_4 = F_xyz((x(i)+h),(y(i)+k_3*h),(z(i)+l_3*h));       
    l_4 = G_xyz((x(i)+h),(y(i)+k_3*h),(z(i)+l_3*h));
    m_4 = H_xyz((x(i)+h),(y(i)+k_3*h),(z(i)+l_3*h));

    x(i+1) = x(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*h;
    y(i+1) = y(i) + (1/6)*(l_1+2*l_2+2*l_3+l_4)*h;  
    z(i+1) = z(i) + (1/6)*(m_1+2*m_2+2*m_3+m_4)*h;
x
y
z
plot (x, y);
hold on
plot (x, z);
end