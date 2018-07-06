function [x] = bifurcationlogisticmap(x0,iteration,Rstart,Rend,Rint,exclude)
%logisticmap: makes a list of elements in logistic map
x(1)=x0;
figure;
hold on;
for i=(Rstart/Rint):(Rend/Rint)
    R=i*Rint;
    for j= 1:iteration
        x(j+1)=R*x(j)*(1-x(j));
    end
    plot(R,x(exclude:iteration),'b.','MarkerSize',1)
end
xlabel('R');
ylabel('x_n');
title('R to x_n');
hold off;





