R=3.3;
x0=.2;
iter=300;
excl=150;
Rstart=2.8;
Rend=4;
Rinterval=(1/500);
Rindex=10;
bifurcationlogisticmap(x0,iter,Rstart,Rend,Rinterval,excl);
% x1=logisticmap(iter,excl,R,x0);
% if(R>3.6)
%     x2=logisticmap(20,1,R+.000001,x0);
%     diffx=x1-x2;
%     figure;
%     plot(excl:iter,diffx(excl:iter),'.')
%     xlabel('n');
%     ylabel('x_{n}');
%     title('differance of init conditions')
% end