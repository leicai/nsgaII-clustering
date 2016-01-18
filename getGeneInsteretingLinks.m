function Gene=getGeneInsteretingLinks(matMST,neighborsMat,instIndex,num_links,L)
%matMST,neighborsMat,instIndex,num_links,L
numChromo=max(max(matMST));

Gene=zeros(num_links,numChromo);

for i=1:num_links
% link=matMST(instIndex(i),:);
% S=link(:,1);
% E=link(:,2);

% SNeighbors=neighborsMat(1:L,S);
% tmpS=size(SNeighbors,1);
% tmpS=randperm(tmpS,1);
% matMST(instIndex(i),2)=SNeighbors(tmpS);

matMST(instIndex(i),2)=matMST(instIndex(i),1);

% showGraphFromLinks(matMST);

chromosome=encoding(matMST);

% showGraphFromVector(chromosome);
% M=size(chromosome,2);
% index=1:M;
% DG = sparse(index,chromosome,true,M,M);
% [S,label] = graphconncomp(DG,'Weak',1);

Gene(i,:)=chromosome;
end
end