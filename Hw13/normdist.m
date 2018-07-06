function [norm] = normdist(x1,x2)
%norm: computes norm distance.
v=x1-x2;
norm=sqrt(v.*v);
end

