clear all;
% lorenz system nonaddaptive RK4
r=45;
b=4;
a=16;

%variation storage
% x(4)=-a*x(4)+a*x(7);
% x(5)=-a*x(5)+a*x(8);
% x(6)=-a*x(6)+a*x(9);
% x(7)=x(4)*(r-x(3))-x(7)-x(1)*x(10);
% x(8)=x(5)*(r-x(3))-x(8)-x(1)*x(11);
% x(9)=x(6)*(r-x(3))-x(9)-x(1)*x(12);
% x(10)=x(2)*x(4)+x(1)*x(7)-b*x(10);
% x(11)=x(2)*x(5)+x(1)*x(8)-b*x(11);
% x(12)=x(2)*x(6)+x(1)*x(9)-b*x(12);

%Lorenz system with its co
f=@(t,x)[a*(x(2)-x(1)) ;
         r*x(1)-x(2)-x(1)*x(3); 
         x(1)*x(2)-b*x(3); 
         -a*x(4)+a*x(7) ;
         -a*x(5)+a*x(8) ;
         -a*x(6)+a*x(9) ;
         x(4)*(r-x(3))-x(7)-x(1)*x(10) ;
         x(5)*(r-x(3))-x(8)-x(1)*x(11) ;
         x(6)*(r-x(3))-x(9)-x(1)*x(12); 
         x(2)*x(4)+x(1)*x(7)-b*x(10) ;
         x(2)*x(5)+x(1)*x(8)-b*x(11);
         x(2)*x(6)+x(1)*x(9)-b*x(12)]; 
%numerical parameters
h=0.001;
numsteps=25000;
%initial x0
x0=zeros(12,numsteps);
x0(:,1)=[-20;-20;50;1;0;0;0;1;0;0;0;1];
%initial time
t0=zeros(1,numsteps);
%compute points and store in a 2 by n matrix
for i= 1:numsteps
    x0(:,i+1)=rk4step(f,t0(i),h,x0(:,i));
    t0(i+1)=t0(i)+h;
end
%var=[x0(:,4)+x0(:,7)+x0(:,10) x0(:,5)+x0(:,8)+x0(:,11) x0(:,6)+x0(:,9)+x0(:,12)];
%w=[x0(:,4), x0(:,5), x0(:,6)];
%v=[x0(:,7), x0(:,8), x0(:,9)];
%u=[x0(:,10), x0(:,11), x0(:,12)];
% plot points
grid on;
title(['Lorenz system with time step h=' num2str(h)])
xlabel('x')
ylabel('y')
zlabel('z')
hold on;
scatter3(x0(1,:),x0(2,:),x0(3,:),'.','b')
point=x0(:,numsteps);
size(point);
varmat=[point(4),point(5),point(6);
        point(7),point(8),point(9);
        point(10),point(11),point(12)]
eigval=eig(varmat);
lambda=(1/numsteps)*log(eigval)


