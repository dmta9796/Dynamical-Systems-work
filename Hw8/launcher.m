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
f=@(t,x)[a*(x(2)-x(1)) r*x(1)-x(2)-x(1)*x(3) x(1)*x(2)-b*x(3) -a*x(4)+a*x(7) -a*x(5)+a*x(8) -a*x(6)+a*x(9) x(4)*(r-x(3))-x(7)-x(1)*x(10) x(5)*(r-x(3))-x(8)-x(1)*x(11) x(6)*(r-x(3))-x(9)-x(1)*x(12) x(2)*x(4)+x(1)*x(7)-b*x(10) x(2)*x(5)+x(1)*x(8)-b*x(11) x(2)*x(6)+x(1)*x(9)-b*x(12)]; 
%numerical parameters
h=0.01;
numsteps=100;
%initial x0
x0=zeros(numsteps,12);
x1=zeros(numsteps,12);
x2=zeros(numsteps,12);
%x0(1,:)=[-13,-12,52,0,0,0,0,0,0,0,0,0];
x0(1,:)=[0,1,2,1,0,0,0,1,0,0,0,1];
x1(1,:)=[10,-5,2,1,0,0,0,1,0,0,0,1];
x2(1,:)=[0,-1,2,1,0,0,0,1,0,0,0,1];

%initial time
t0=zeros(numsteps,1);

%compute points and store in a 2 by n matrix
for i= 1:numsteps
    x0(i+1,:)=rk4step(f,t0(i),h,x0(i,:));
    x1(i+1,:)=rk4step(f,t0(i),h,x1(i,:));
    x2(i+1,:)=rk4step(f,t0(i),h,x2(i,:));
    t0(i+1)=t0(i)+h;
end
x0
var=[x0(:,4)+x0(:,7)+x0(:,10) x0(:,5)+x0(:,8)+x0(:,11) x0(:,6)+x0(:,9)+x0(:,12)];
var
w=[x0(:,4), x0(:,5), x0(:,6)];
v=[x0(:,7), x0(:,8), x0(:,9)];
u=[x0(:,10), x0(:,11), x0(:,12)];
vol=zeros(length(w),1);
for i=1:length(w)
    vol(i)=dot(u(i,:),cross(w(i,:),v(i,:)));
end
vol; % test to see if the system is dissapative
% plot points
%hold on;
grid on;
title(['Lorenz system with time step h=' num2str(h)])
xlabel('x')
ylabel('y')
zlabel('z')
hold on;
%scatter3(x0(:,1),x0(:,2),x0(:,3),'.','b')
%scatter3(x1(:,1),x1(:,2),x1(:,3),'.','r')
%scatter3(x2(:,1),x2(:,2),x2(:,3),'.','g')

scatter3(x0(:,4),x0(:,7),x0(:,10),'.','b')
scatter3(x1(:,5),x1(:,8),x1(:,11),'.','r')
scatter3(x2(:,6),x2(:,9),x2(:,12),'.','g')
%subplot(2,2,2);
%scatter3(x0(:,1)+x0(:,4),x0(:,2)+x0(:,7),x0(:,3)+x0(:,10),'.','r')
%subplot(2,2,3);
%scatter3(x0(:,1)+x0(:,5),x0(:,2)+x0(:,8),x0(:,3)+x0(:,11),'.','g')
%subplot(2,2,4);
%scatter3(x0(:,1)+x0(:,6),x0(:,2)+x0(:,9),x0(:,3)+x0(:,12),'.','y')


