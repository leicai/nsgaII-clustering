function matNeighorIndex=getNeighbors(data,matDistance)
% Input:
%   data - The orginal data.
%   matDistance - The distance matrix.
%   L - The size of neighborhood.
% Output:
%   matNeighorIndex - ith column represents ith element's neighborhood

[M N]=size(data);
matNeighorIndex=zeros(M-1,M);

for i=1:M

    index1=matDistance(:,1)==i;
    index2=matDistance(:,2)==i;
    index=xor(index1,index2);
    
    Distances=matDistance(index,:);
    [value index]=sortrows(Distances,3);
    
    Distances=Distances(index,1:2);
    Distances=reshape(Distances',1,(M-1)*2);
    
    neighbors=(Distances(Distances~=i))';
   
    matNeighorIndex(:,i)=neighbors;
end

end