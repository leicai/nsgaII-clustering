function Dev=getDevFromLabel(data,label,k)
% Input:
% data         - The orignal data
% label        - The label of cluster data
% k            - The scale of cluster

Dev=0;

for i=1:k
clusterData=data(label==i,:);
centorid=mean(clusterData);
[M ~]=size(clusterData);
centorid=repmat(centorid,[M 1]);
diff=sum(sqrt(sum((clusterData-centorid).^2,2)),1);
Dev=Dev+diff;
end

end