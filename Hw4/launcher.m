m=0.1;
L=0.1;
g=9.8;
A=0;%0.9;
al=0;%(3/4)*sqrt(g/L);
B=0;%0.25;
c1=A/(m*L);
c2=g/L;
c3=B/m;
f=@(t,x)[x(2), c1*cos(al*t)-c2*sin(x(1))-c3*x(2)]; %function vector
h=0.1;
angle0=0.5;
omega0=0.2;
numsteps=1000;

%initial x0
x0=zeros(numsteps,2);
x0(1,:)=[angle0,omega0];

%initial x1
x1=zeros(numsteps,2);
x1(1,:)=[angle0+0.001,omega0+0.001];

%initial time
t0=zeros(numsteps,1);

%compute points and store in a 2 by n matrix
for i= 1:numsteps
    x0(i+1,:)=rk4(f,t0(i),h,x0(i,:));
    x1(i+1,:)=rk4(f,t0(i),h,x1(i,:));
    xlim([0,2*pi])
    t0(i+1)=t0(i)+h;
end
% plot points
hold on;
grid on;
title(['time step h=' num2str(h)])
xlabel('theta')
ylabel('omega')
scatter(x0(:,1),x0(:,2),'.','b')
%scatter(x1(:,1),x1(:,2),'.','p')

