function [point] = bisection(a,b,target,iter)
%takes the bisection of two points 
for i=1:iter
    mid=(a+b)/2;
    if(mod(a,T)<mod(mid,T))
        a=mid;
    end
    if(mod(a,T)>mod(mid,T))
        b=mid;
    end
    [a,b]
end
point=[a,b];
end

