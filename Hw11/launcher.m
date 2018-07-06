%system parameters
G=1;
m1=1;
m2=1;

%two body problem
%x(1)=x(4);
%x(2)=x(5);
%x(3)=x(6);
%x(4)=G*m2*(x(1)-x(7))/(x(1)-x(7))^(3/2);
%x(5)=G*m2*(x(2)-x(8))/(x(2)-x(8))^(3/2);
%x(6)=G*m2*(x(3)-x(9))/(x(3)-x(9))^(3/2);
%x(7)=x(10);
%x(8)=x(11);
%x(9)=x(12);
%x(10)=G*m1*(x(7)-x(1))/(x(7)-x(1))^(3/2);
%x(11)=G*m1*(x(8)-x(2))/(x(8)-x(2))^(3/2);
%x(12)=G*m1*(x(9)-x(3))/(x(9)-x(3))^(3/2);
%two body problem system
%j=((x(7)-x(1))^2+(x(8)-x(2))^2+(x(9)-x(3))^2)^(1/2);
f=@(t,x)[x(4);
    x(5);
    x(6);
    -G*m2*(x(1)-x(7))/((x(1)-x(7))^2+(x(2)-x(8))^2+(x(3)-x(9))^2)^(3/2);
    -G*m2*(x(2)-x(8))/((x(1)-x(7))^2+(x(2)-x(8))^2+(x(3)-x(9))^2)^(3/2);
    -G*m2*(x(3)-x(9))/((x(1)-x(7))^2+(x(2)-x(8))^2+(x(3)-x(9))^2)^(3/2);
    x(10);
    x(11);
    x(12);
    -G*m1*(x(7)-x(1))/((x(7)-x(1))^2+(x(8)-x(2))^2+(x(9)-x(3))^2)^(3/2);
    -G*m1*(x(8)-x(2))/((x(7)-x(1))^2+(x(8)-x(2))^2+(x(9)-x(3))^2)^(3/2);
    -G*m1*(x(9)-x(3))/((x(7)-x(1))^2+(x(8)-x(2))^2+(x(9)-x(3))^2)^(3/2)];
%numerical parameters
h=0.001;
numsteps=20000;
%initial x0
x0=zeros(12,numsteps);
%x0(:,1)=[0;1;2;1;0;0;0;1;0;0;0;1];
x0(:,1)=[0;0;0;0;0;0;2;0;0;0;1;0];


%initial time
t0=zeros(numsteps,1);

%compute points and store in a 2 by n matrix
for i= 1:numsteps
    x0(:,i+1)=rk4step(f,t0(i),h,x0(:,i));
    t0(i+1)=t0(i)+h;
end
x0';
x0(:,numsteps)'
%vol; % test to see if the system is dissapative
% plot points
hold on;
grid on;
title(['two body problem with time step h=' num2str(h)])
xlabel('x')
ylabel('y')
zlabel('z')
hold on;
scatter3(x0(1,:),x0(2,:),x0(3,:),'.','b')
scatter3(x0(7,:),x0(8,:),x0(9,:),'.','r')



