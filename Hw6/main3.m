clc; % Clears the screen
clearvars;
m=0.1;
L=0.1;
g=9.8;
A=0.9;
al=(3/4)*sqrt(g/L);
B=0.25;
c1=A/(m*L);
c2=g/L;
c3=B/m;
f=@(t,x)[x(2) c1*cos(al*t)-c2*sin(x(1))-c3*x(2)]; %function vector
h=0.005;
angle0=0.0;
omega0=0.0;
numsteps=300000;
%initial x0
x0=zeros(numsteps,2);
x0(1,:)=[angle0,omega0];
%initial x1
x1=zeros(numsteps,2);
x1(1,:)=[angle0+.0001,omega0+.0001];
t0=zeros(numsteps,1);
%T=1/(exp(pi)*exp(3));
%T=2*pi/sqrt(g/L)
T=(2*pi)/al;
counter=0;

%compute points and store in a 2 by n matrix
for i= 1:numsteps
    x0(i+1,:)=rk4step(f,t0(i),h,x0(i,:));
    x1(i+1,:)=rk4step(f,t0(i),h,x1(i,:));
    t0(i+1)=t0(i)+h;
end
%xlim([0,min(angle0,2*pi)])
xlim([0,2*pi])
% plot points
hold on;
grid on;
title('chaotic pendulum')
xlabel('theta')
ylabel('omega')
scatter(x0(:,1),x0(:,2),'.','b')
%scatter(x1(:,1),x1(:,2),'.','g')

% plot points when time plane crosses
for i=1:numsteps
    xrow0=x0(i,:);
    if(mod(t0(i+1),T)<=mod(t0(i),T))
        %scatter(xrow0(1),xrow0(2),'.','r')
    end
end