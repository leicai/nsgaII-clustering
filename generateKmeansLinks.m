function newMST=generateKmeansLinks(MST,label)
M=size(MST,1);
for i=1:M
    if label(MST(i,1))~=label(MST(i,2))
        % All links that cross cluster boudaries are removed.
        inSameCluster=find(label==label(MST(i,1)));
        
        % Eliminate the element itself
        
        inSameCluster=inSameCluster(inSameCluster~=(MST(i,1)));
        
        ncl=size(inSameCluster,1);
        if ncl>1
            n=randperm(ncl,1);
            MST(i,2)=inSameCluster(n);
        else
            MST(i,2)=MST(i,1); % The situation of isolated clustering.
    end
       
end
newMST=MST;
end