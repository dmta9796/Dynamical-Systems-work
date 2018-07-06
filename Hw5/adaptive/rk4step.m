function [x] = rk4step(f,t,h,x)
%rk 4 step
k1=f(t,x);
k2=f(t+h/2,x+(h/2)*k1);
k3=f(t+h/2,x+(h/2)*k2);
k4=f(t+h,x+h*k3);
x=x+(h/6)*(k1+2*k2+2*k3+k4);
end