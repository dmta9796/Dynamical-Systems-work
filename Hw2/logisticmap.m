function [x] = logisticmap(iter,exclude,R,x0)
%logisticmap: makes a list of elements in logistic map
x(1)=x0;
for i= 1:iter
    x(i+1)=R*x(i)*(1-x(i));
end
figure;
subplot(1,3,1);
plot(x(exclude:iter),x(exclude+1:iter+1),'.')
xlabel('x_n')
ylabel('x_{n+1}')
title('x_n to x_{n+1}')

subplot(1,3,2);
plot(exclude:iter,x(exclude:iter),'.')
xlabel('n')
ylabel('x_{n}')
title('n to x_n')

 subplot(1,3,3);
 plot(x(exclude+1:2:iter-1),x(exclude+3:2:iter+1),'.')
 xlabel('x_n')
 ylabel('x_{n+2}')
 title('R to x_{n+2}')


