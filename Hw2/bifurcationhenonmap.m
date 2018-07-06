function [x] = bifurcationhenonmap(x0,y0,b,iteration,astart,aend,aint,exclude)
%logisticmap: makes a list of elements in logistic map
x(1)=x0;
y(1)=y0;
figure;
hold on;
for i=(astart/aint):(aend/aint)
    a=i*aint;
    for j= 1:iteration
        x(j+1)=y(j)+1-a*x(j)*x(j);
        y(j+1)=b*x(j);
    end
    plot(a,x(exclude:iteration),'b.','MarkerSize',1)
end
xlabel('a');
ylabel('x_n');
title('a to x_n');
hold off;





