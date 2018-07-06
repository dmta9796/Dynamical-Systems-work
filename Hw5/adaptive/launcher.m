clc; % Clears the screen
clear all;
a=16;
r=45;
b=4;
f=@(t,x)[a*(x(2)-x(1)) r*x(1)-x(2)-x(1)*x(3) x(1)*x(2)-b*x(3)];
%d=.398;
%e=2;
%f=4;
%g=@(t,x)[-(x(2)+x(3)) x(1)+d*x(2) e+x(3)*(x(1)-f)];
h=0.001;
t0=0;
x0=[-13,-12,52];
%x0=[0.1,-0.01,0.001];
tol=0.001;
numsteps=10;
for i=1:numsteps
    
    scatter3(x0(1),x0(2),x0(3),'.','r')
    [x0,h]=adaptivelogic(f,t0,h,x0,tol);
    title(sprintf('tolerance=%2f',tol))
    xlabel('x')
    ylabel('y')
    zlabel('z')
    hold on;
    t0=t0+h;
end
