function [x1,h] = adaptivelogic(f,t,h,x,tol)
%takes multiple steps of rk4 algorithm to map out the diff eq.
% step size changes by multiple of two whenever a change of h is needed
%take one step
x2=rk4step(f,t,h,x);
%take two smaller steps
xi=rk4step(f,t,h/2,x);
x1=rk4step(f,t,h/2,xi); %give back better result
%compute norm check if within tolerance
err=normdist(x1,x2);
if(err>tol)
    h=h/2;
end
if(err<tol)
    %take a larger step and see if it would work
    x1=rk4step(f,t,h,x2); %two steps(one step computed before)
    x2=rk4step(f,t,2*h,x); %take large step
    err=normdist(x1,x2);
    if(err<tol)
        h=2*h;
    end
end
end

