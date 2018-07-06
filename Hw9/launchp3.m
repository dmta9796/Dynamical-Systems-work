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
numsteps=150000;
transient=10000;
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
xdata=x0(1,:)
data=[xdata',t0'];
fileID = fopen('timeseries.txt','w');
fprintf(fileID,"%f %f\n",data');
fclose(fileID);

data=importdata('timeseries.txt')


