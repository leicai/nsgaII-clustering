function chromosome=encoding(linkMat)
N=size(linkMat,1);

chromosome=zeros(1,N+1);

% To remove some self-links
diff=(linkMat(:,1)-linkMat(:,2))==0;
diff=repmat(diff,[1 2]);
linkMat(diff)=0;

tmp=reshape(linkMat,[1 N*2]);
histNodes=histc(tmp,1:N+1);

while sum(histNodes>0,2)>0
    indSingle=find(histNodes==1);
    if isempty(indSingle) % There is a circle
        tmpIndex=find(sum(linkMat,2)~=0);
        tmpIndex=tmpIndex(1);
        index=linkMat(tmpIndex,1);
        value=linkMat(tmpIndex,2);
        
        chromosome(index)=value;
        histNodes(value)=histNodes(value)-1;
        histNodes(index)=histNodes(index)-1;

        linkMat(tmpIndex,:)=[0 0];
    else
        for j=1:size(indSingle,2)
            selectedOne=find(linkMat(:,1)==indSingle(j)|linkMat(:,2)==indSingle(j)==1);
            if(~isempty(selectedOne))
                line=linkMat(selectedOne,:);
                index=line(line==indSingle(j));
                value=line(line~=indSingle(j));
                
                histNodes(value)=histNodes(value)-1;
                histNodes(index)=histNodes(index)-1;
                if chromosome(index)==0
                    chromosome(index)=value;
                else
                    chromosome(value)=index;
                end
                linkMat(selectedOne,:)=[0 0];
            end
        end
    end
end
chromosome(find(chromosome==0))=find(chromosome==0);
end