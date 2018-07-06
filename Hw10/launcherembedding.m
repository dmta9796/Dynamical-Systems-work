
%r=45;
%b=4;
%a=16;
%init=[-20,-20,50];
%data=Lorenz(r,b,a,init);

data=importdata('timeseries.txt');
T=110;
m=7;
data=embedding2(T,m,1,2,3,data);

% plot points
%grid on;
%title(['Lorenz system with time step h=' num2str(h)])
%xlabel('x')
%ylabel('y')
%zlabel('z')
%hold on;
%scatter3(data(:,1),data(:,2),data(:,3),'.','b')

%boxcounting
%pow=4;
%side=2^pow;
%boxcountingdim(data,side)

%plot of ln(N(ep)) and ln(1/ep)
pow=9;
%num=400;
cd=zeros(2,pow);
entries=zeros(2,pow);
for i=1:pow
    side=2^i;
    %cd(:,i)=[i,boxcountingdim(data,side)];
    result=boxdimval(data,side);
    entries(:,i)=boxdimval(data,side);
end
hold on;
xlabel('ln(ep)');
ylabel('ln(N(ep))');
%scatter(cd(1,:),-cd(2,:))
scatter(log(entries(2,:)),log(entries(1,:)),'.')
index1=5;
index2=4;
box= (log(entries(1,index1))-log(entries(1,index2)))/(log(entries(2,index1))-log(entries(2,index2)))
%hold on;
%xlabel('ep: Number of Side Partitions');
%ylabel('N(ep): Marked Cubes');
%scatter(entries(2,:),entries(1,:),'.')