function [] = odesolver(f,t,h,x,tol)
%takes multiple steps of rk4 algorithm to map out the diff eq.
%take one step
x1=rk4(f,t,h,x);
%take two smaller steps
xi=rk4(f,t,h/2,x);
x2=rk4(f,t,h/2,xi);
%compute norm check if within tolerance
err=normdist(x1,x2);
if(err>tol)
    h=h/2;
end
%take a larger step and see if it would work
x1=rk4(f,t,h,x1); %two steps(one step done before)
x2=rk4(f,t,2*h,x); %take large step
err=normdist(x1,x2);
if(err<tol)
    h=2*h;
end


end

