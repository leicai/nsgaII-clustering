function npop=getNormalizedPopulation(pop,zideal,param)
m=param.m;

[M N]=size(pop);
objects=pop(:,N-m+1:N);
normalizedObjs=zeros(M,m);
    
zmax=max(objects);
    
zideal=repmat(zideal,M,1);
zmax=repmat(zmax,M,1);
    
normalizedObjs=(objects-zideal)./(zmax-zideal);  
npop=[pop(:,1:N-m) normalizedObjs(:,:)];
end