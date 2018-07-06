function [lambda] = wolf2(data,tol,first,last)
%Wolf Algorithm
%   Detailed explanation goes here
L=[];
Lprime=[];
%feddata=data(first:last,:);
%size(start)
%feddata(start,:)
a=data(first,:);
index=neighbor(data,a,tol);
if(index>last)
    fprintf("can't find neighbor in tolerance at start \n");
    lambda="err";
    return;
end
b=data(index,:);
V=b-a;
dist=sqrt(V*V'); %euclidian distance
L(1)=dist;%append to list
for k=first:last
    a=data(k,:);
    index=index+1
    b=data(index,:);
    %[a,b]
    V=b-a;
    dist=sqrt(V*V');
    if(dist>tol)
        Lprime=[Lprime,dist];
        index=neighbor(data,a,tol);
        if(index>last)
            fprintf("can't find neighbor in toleranceat step %d \n",k);
            lambda="err";
            break;
        end
        index;
        b=data(index,:);
        V=b-a;
        dist=sqrt(V*V');
        %[b,a,dist]
        L=[L,dist];
    end
end
%[L',[Lprime';0]];
sum=0;
for i=1:length(L)-1
    log2(Lprime(i)/L(i));
    sum=sum+log2(Lprime(i)/L(i));
end
lambda=1/(last-first)*sum;
end

