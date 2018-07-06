function [x] = henonmap(iter,exclude,a,b,x0,y0)
%logisticmap: makes a list of elements in logistic map
x(1)=x0;
y(1)=y0;
for i= 1:iter
    x(i+1)=y(i)+1-a*x(i)*x(i);
    y(i+1)=b*x(i);
end
figure;
plot(x(exclude:iter),x(exclude+1:iter+1),'.')
xlabel('x_n')
ylabel('x_{n+1}')
title('x_n to x_{n+1}')




end

