function [] = rightfractaltree(x0,y0,x1,y1,iter,deltalen,angle,depth)
%fracal tree
%   draws a tree with each side having a certain length
if iter > 0
    vector=[0;1;1];
    translatemat=[1 0 x1; 0 1 y1 ;0 0 1];
    scalemat=[deltalen 0 0;0 deltalen 0 ;0 0 1];
    rotmat = [cos(angle) -sin(angle) 0; sin(angle) cos(angle) 0 ; 0 0 1];
    vector= translatemat*mpower(rotmat*scalemat,depth)*vector;
    fractaltree(x1,y1,vector(1),vector(2),iter-1,deltalen,angle,depth+1)
    vector=[0;1;1];
    rotmat=[cos(angle) sin(angle) 0; -sin(angle) cos(angle) 0 ; 0 0 1];
    vector= translatemat*mpower(rotmat*scalemat,depth)*vector;
    fractaltree(x1,y1,vector(1),vector(2),iter-1,deltalen,angle,depth+1)
end
plot([x0 x1],[y0 y1],'color','green');
hold on;
end

