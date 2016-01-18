function [k labels]=getLableFromChromosome(chromosome)
c=size(chromosome,2);
index=1:c;
DG = sparse(chromosome,index,true,c,c);
[k,labels] = graphconncomp(DG,'Weak',1);
end