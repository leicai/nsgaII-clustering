function conv=getConnFromLabel(data,label,k,param)

M=size(data,1);
L=param.L;



conv=0;
if k==1
    conv=M;
    return
end


if ~isfield(param, 'matNeighbors')
    for i=1:k
        clusterData=data(label==i,:);
        [M ~]=size(clusterData);
        for j=1:M
            singleData=clusterData(j,:);
            neighbors=getNearestNeighbor(singleData,data,L);
            index=~ismember(neighbors,clusterData,'rows')';
            tmp=1:L;
            conv=conv+sum(1./tmp(index)); 
        end
    end
else
    for i=1:k
        indLabel=find((label==i)==1);
        numEC=length(indLabel);
        for j=1:numEC
    %         singleData=data(indLabel(j),:);
            indNeighbors=param.matNeighbors(1:L,indLabel(j));
            index=~ismember(indNeighbors,indLabel','rows');
            tmp=1:L;
            conv=conv+sum(1./tmp(index));
        end

    end
end
end

