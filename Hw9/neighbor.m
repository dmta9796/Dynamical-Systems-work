function [index] = neighbor(data,a,tol)
%finds nearest neighbor to point a that isn't in feduciary trajectory
%pointb=[Inf,Inf,Inf];
index=Inf;
angle=pi/10;
anglesteps=20;
for i=1:length(data)
    V=data(i,:)-a;
    dist=sqrt(V*V');
    for j=1:anglesteps
        upvec=a-[a(1),a(2),a(3)+1.0];
        vec=data(i,:)-a;
        lenupvec=sqrt(upvec*upvec');
        lenvec=sqrt(vec*vec');
        distangle=acos((upvec*vec')/(lenupvec*lenvec));
        if(dist<tol && dist>0 && distangle<angle)
            %pointb=data(i);
            index=i;
            return;
        end
        angle=angle+angle;
    end
end
end

