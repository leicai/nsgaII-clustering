function mat=getDistanceMat(data)
[M N]=size(data);
RowSize=sum(1:M-1);
mat=zeros(RowSize,3);
index=1;
for i=1:M-1
    singleData=data(i,:);
    singleData=repmat(singleData,[M-i,1]);
    comparedData=data(i+1:M,:);
    
    % To compute the distances.
    distances=sqrt(sum((singleData-comparedData).^2,2));
    
    % The first and second column of weigth matrix.
    colOne=repmat(i,[M-i,1]);
    colTwo=(i+1:M)';
    
    % Final matrix.
    mat(index:index+M-i-1,1)=colOne;
    mat(index:index+M-i-1,2)=colTwo;
    mat(index:index+M-i-1,3)=distances;
    index=index+M-i;
end
end