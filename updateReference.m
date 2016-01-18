function newReference=updateReference(Z,solutions,param)
% Input:
% Z           - Ideal point set
% solution    - Current solution
% param       - Other parameters
% Output:
% newReference - The new ideal point set
m=param.m;
newReference=Z;
[M N]=size(solutions);
objective=solutions(:,N-m+1:N);
objective=min(objective);
index=find((objective<Z)==1);
if ~isempty(index) 
    newReference(:,index)=objective(:,index);
end
end