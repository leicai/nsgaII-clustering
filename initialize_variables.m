function [POP param] = initialize_variables(n,param)
V=size(param.data,1);
m=param.m;
c=param.c;
data=param.data;
M=size(data,1);

POP=zeros(n,V);
obj=zeros(n,m);

% Generation of interesting MST solutions
distanceMat=getDistanceMat(data);
[matMST ST]=getMST(distanceMat,M);

neighborsMat=getNeighbors(data,distanceMat);

param.matNeighbors=neighborsMat;

[instValue instIndex]=getInteresingLink(matMST,neighborsMat,2);
% showGraphFromLinks(matMST)
I=size(instValue(instValue~=0),1);
num_intMST=min(I,0.5*n-1);

POP(1:num_intMST,:)=getGeneInsteretingLinks(matMST,neighborsMat,instIndex,num_intMST,2);

% Generation of k-Means solutions
num_intKmeans=n-num_intMST;

for i=2:num_intKmeans+1
    [centroid pointsInCluster labels]=KMeans(data,i,10);
    matLinks=generateKmeansLinks(matMST,labels);
    chromosome=encoding(matLinks);
    POP(num_intMST+i-1,1:V)=chromosome;
end


for i=1:n
    obj(i,:)=evaluate_objective(POP(i,:),param);
end
POP=[POP obj];
end
