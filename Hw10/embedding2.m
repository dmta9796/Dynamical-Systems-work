function [points] = embedding2(t,m,a,b,c,data)
%EMBEDDING
%t: interval between points in time series
%m: dimension of embedding
%a,b,c are the reporjection points of the embedding back into 3D for lorenz
%data: the time series data
%
datalen=length(data)-m*t;
points=zeros(datalen,m);
%size(points);
for i=1:datalen
    %vec=zeros(1,m);
    for k=1:m
        points(i,k)=data(i+(k-1)*t,1);
    end
end

points=[points(:,a) points(:,b),points(:,c)];
end

