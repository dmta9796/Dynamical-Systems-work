function [val] = boxdimval(data,side)
%boxcountingdim(): checks what the box countining dimension of the system
markers=zeros(side,side,side);
%count=side*side*side;
size(markers);
as=min(data(:,1))-0.01;
bs=min(data(:,2))-0.01;
cs=min(data(:,3))-0.01;
ae=max(data(:,1))+0.01;
be=max(data(:,2))+0.01;
ce=max(data(:,3))+0.01;
inta=(ae-as)/side;
intb=(be-bs)/side;
intc=(ce-cs)/side;
for k=1:length(data)
    point=data(k,:);
    pointx=round((point(1)-as)/inta)+1;
    pointy=round((point(2)-bs)/intb)+1;
    pointz=round((point(3)-cs)/intc)+1;
    markers(pointx,pointy,pointz)=1;
end
ne=sum(sum(sum(markers)));
val=[ne,side];
end