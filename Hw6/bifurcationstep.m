function [value] = bifurcationstep(A,numsteps,transient)
%bifurcationstep
m=0.1;
L=0.1;
g=9.8;
al=0.6667;%(3/4)*(1/(2*pi*sqrt(L/g)));
B=0.25;
c1=A;%A/(m*L);
c2=1;%g/L;
c3=0.5;%B/m;
f=@(t,x)[x(2) c1*cos(al*t)-c2*sin(x(1))-c3*x(2)]; %function vector
h=0.01;
angle0=-2+2*pi;
omega0=0.0;
%initial x0
x0=zeros(numsteps,2);
x0(1,:)=[angle0,omega0];
%initiate time array
t0=zeros(numsteps,1);

%compute points and store in a 2 by n matrix
for i= 1:numsteps
    x0(i+1,:)=rk4(f,t0(i),h,x0(i,:));
    t0(i+1)=t0(i)+h;
end
omega=x0(:,2);
theta=x0(:,1);
value=omega(transient:numsteps-1);
end

