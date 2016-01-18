function [matMST sparseMST]=getMST(distanceMat,N)
% To get the minimum spanning tree from distances matrix
% Input:
%   distanceMat - The matrix of distances.
%   N   - The number of elements.
% Output:
%   matMST - The matrix to describe the relationship of link in MST
%   sparseMST - Descrition of MST using sparse matrix.
DG=sparse(distanceMat(:,1)',distanceMat(:,2)',distanceMat(:,3)',N,N);
UG=tril(DG+DG');
[sparseMST,pred] = graphminspantree(UG);
[U V]=find(sparseMST);
matMST=[U V];
end