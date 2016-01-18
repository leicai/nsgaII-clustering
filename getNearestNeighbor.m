function nn=getNearestNeighbor(x,data,L)
[M N]=size(data);
x=repmat(x,[M 1]);
distance=sqrt(sum((x-data).^2,2));
[dat index]=sort(distance);
nn=data(index(2:L+1),:); % To elimate the curent element itself.
end
