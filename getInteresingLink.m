function [value index]=getInteresingLink(MST,neighbors,L)

% [S E]=find(MST);
S=MST(:,1);
E=MST(:,2);
% num_links=nnz(MST);
num_links=size(MST,1);

matInteresting=zeros(num_links,1);

for p=1:num_links
    i=S(p,:);
    j=E(p,:);
    
    % Find the neighbors for the first item
    nn_i=neighbors(:,i);
    nn_j=neighbors(:,j);
    
    l=find(nn_j==i);
    k=find(nn_i==j);
    if min(l,k)>L
        d=min(l,k);
    else
        d=0;
    end
    matInteresting(p,:)=d;
end

[value index]=sort(matInteresting,'descend');
end