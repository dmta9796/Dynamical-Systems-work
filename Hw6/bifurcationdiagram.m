%bifurcation
title('bifurcation diagram')
xlabel('time')
ylabel('theta')
Astart=0;
Astep=0.05;
Aend=2.5;
steps=(Aend-Astart)/Astep;
iter=1000;
excl=950;
Ax=zeros(steps,1);
Ay=zeros(steps,iter-excl);
for i=1:steps
    Ay(i,1:(iter-excl))=bifurcationstep(Astart+i*Astep,iter,excl);
    Ax(i)=Astart+i*Astep;
end
xlabel('A')
ylabel('theta')
n=[-1,0];
size(Ay);
size(Ay(:,1:iter-excl));
p0=[0,1];
for i=1:steps
    x=Ax(i);
    xval=repmat(x,1,iter-excl);
    %size(xval)
    scatter(xval,Ay(i,1:(iter-excl)),'.','b')
    hold on;
%     p=Ay(i,1:iter-excl);
%     for j=1:length(p)-1
%         cond1=and(p(j+1)>0,p(j)<0);
%         if(cond1)
%             scatter(x,p(j+1),'.','b')
%             hold on;
%         end
%     end
end