clc; % Clears the screen
clearvars;
m=0.1;
L=0.1;
g=9.8;
A=m*L*1.175;
al=(3/4)*(1/(2*pi*sqrt(L/g)))
B=0.25;
c1=A/(m*L)
c2=g/L
c3=B/m
f=@(t,x)[x(2) c1*cos(al*t)-c2*sin(x(1))-c3*x(2)]; %function vector
% a=16;
% r=45;
% b=4;
% f=@(t,x)[a*(x(2)-x(1)) r*x(1)-x(2)-x(1)*x(3) x(1)*x(2)-b*x(3)];
%d=.398;
%e=2;
%f=4;
%g=@(t,x)[-(x(2)+x(3)) x(1)+d*x(2) e+x(3)*(x(1)-f)];
h=0.005;
angle0=1.0;
omega0=1.0;
x0=[angle0,omega0];
numsteps=1000;
t0=zeros(numsteps,1);
%T=1/(exp(pi)*exp(3));
T=2*pi*sqrt(L/g);
for i=1:numsteps
    x0(i+1)=rk4step(f,t0(i),h,x0(i));
    title('time poincare section for T!=(n/m)*T0')
    xlabel('theta')
    ylabel('omega')
    xlim([0,max(angle0,2*pi)])
    ylim([-5,5])
    t0(i+1)=t0(i)+h;
    %scatter(x0(1),x0(2),'.','b')
    if(mod(t0(i+1),T)<=mod(t0(i),T))
        dist=abs(t0(i+1)-t0(i));
        xdist=abs(T-t0(i-1));
        tf=xdist/dist;
        xmid=x0(i-1)*(1-t)+x0(i)*t;
        scatter(xmid(1),xmid(2),'.','r')
    end
    hold on;
end