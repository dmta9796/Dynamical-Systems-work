function [data] = Lorenz(r,b,a,init)
%Lorenz():computes points of lorenz attractor
% lorenz system nonaddaptive RK4
%Lorenz system with its co
f=@(t,x)[a*(x(2)-x(1)) r*x(1)-x(2)-x(1)*x(3) x(1)*x(2)-b*x(3)];
%numerical parameters
h=0.001;
numsteps=10000000;
%initial x0
x0=zeros(numsteps,3);
x0(1,:)=init;
%x0(1,:)=[0,1,2];
%initial time
t0=zeros(numsteps,1);
%compute points and store in a 2 by n matrix
for i= 1:numsteps
    x0(i+1,:)=rk4step(f,t0(i),h,x0(i,:));
    t0(i+1)=t0(i)+h;
end
% x0=x0(transient:numsteps,:); %remove transient
data=x0;



end

