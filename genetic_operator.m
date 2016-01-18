function Pop2  = genetic_operator(parent_chromosome, mum, param)
V=param.c;
MaxVal=param.c;
m=param.m;

parent_chromosome=parent_chromosome(:,1:V);

[M N]=size(parent_chromosome);
W=[randperm(M) randperm(M)];

% uniform corssover
idx = logical(round(rand(size(parent_chromosome)))); 
Pop2 = parent_chromosome(W(1:2:end),:);                                      
P2A = parent_chromosome(W(2:2:end),:);                                        
Pop2(idx) = P2A(idx);  

% mutation
idx = rand(size(Pop2))<mum;                                 % Index of Mutations
Pop2(idx) = round(rand([1,sum(sum(idx))])*(MaxVal-1)+1);        % Mutated Value

obj=zeros(M,m);
for i=1:M 
    obj(i,:)=evaluate_objective(Pop2(i,:),param);
end
Pop2=[Pop2 obj];
