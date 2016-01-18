function f = evaluate_objective(solution,param)
data=param.data;
c=param.c;
L=param.L;

if length(solution)~=c
solution=solution(1:c,:);
end

index=1:c;
DG = sparse(solution,index,true,c,c);
[k,label] = graphconncomp(DG,'Weak',1);

% For two objectives
f(1)=getDevFromLabel(data,label,k);
f(2)=getConnFromLabel(data,label,k,param);

end
