clear all;
% lorenz system nonaddaptive RK4
r=45;
b=4;
a=16;
%Lorenz system with its co
f=@(t,x)[a*(x(2)-x(1)) r*x(1)-x(2)-x(1)*x(3) x(1)*x(2)-b*x(3)];
%numerical parameters
h=0.001;
numsteps=50000;
transient=10000;
%initial x0
x0=zeros(numsteps,3);
x0(1,:)=[-20,-20,50];
%x0(1,:)=[0,1,2];
%initial time
t0=zeros(numsteps,1);
%compute points and store in a 2 by n matrix
for i= 1:numsteps
    x0(i+1,:)=rk4step(f,t0(i),h,x0(i,:));
    t0(i+1)=t0(i)+h;
end
x0=x0(transient:numsteps,:); %remove transient

% plot points
grid on;
title(['Lorenz system with time step h=' num2str(h)])
xlabel('x')
ylabel('y')
zlabel('z')
hold on;
scatter3(x0(:,1),x0(:,2),x0(:,3),'.','b')

%wolf algorithm
tol=5.0;
%tol=0.000001;
first=25000;
last=numsteps-transient;
%scatter3(x0(first:last,1),x0(first:last,2),x0(first:last,3),'.','r')
wolf2(x0,tol,first,numsteps-transient)


