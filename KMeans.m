function[centroid, pointsInCluster, assignment]= KMeans(data, k,iterations)
% usage
% function[centroid, pointsInCluster, assignment]=
% Kmeans(data, k)
%
% Output:
% centroid: matrix in each row are the Coordinates of a centroid
% pointsInCluster: row vector with the nbDatapoints belonging to
% the centroid
% assignment: row Vector with clusterAssignment of the dataRows
%
% Input:
%   data - The data in rows
%   k - nb of centroids to determine
%   iterations - Scale for the number of iterations for kmeans

data_dim = length(data(1,:));
nbData   = length(data(:,1));


% init the centroids randomly
data_min = min(data);
data_max = max(data);
data_diff = data_max - data_min ;
% every row is a centroid
centroid = ones(k, data_dim) .* rand(k, data_dim);
for i=1 : 1 : length(centroid(:,1))
  centroid( i , : ) =   centroid( i , : )  .* data_diff;
  centroid( i , : ) =   centroid( i , : )  + data_min;
end
% end init centroids

if nargin == 3 % Run k-means according to iterations

% main loop until
    while iterations > 0

      % E-Step
      assignment = [];
      % assign each datapoint to the closest centroid


      for d=1:length(data(:,1))
          curData=repmat(data(d,:),[k 1]);
          diff=sum((curData-centroid).^2,2);
          [minValue minIndex]=min(diff);
          curAssignment=minIndex;
          assignment=[assignment;curAssignment];
      end


      % for the stoppingCriterion
      oldPositions = centroid;

      % M-Step
      % recalculate the positions of the centroids
      centroid = zeros(k, data_dim);
      pointsInCluster = zeros(k, 1);

      for d = 1: length(assignment);
        centroid( assignment(d),:) = centroid( assignment(d),:)+data(d,:);
        pointsInCluster( assignment(d), 1 )=pointsInCluster( assignment(d), 1 )+1;
      end



      for c = 1: k;
        if( pointsInCluster(c, 1) ~= 0)
          centroid( c , : ) = centroid( c, : ) / pointsInCluster(c, 1);
        else
          % set cluster randomly to new position
          centroid( c , : ) = (rand( 1, data_dim) .* data_diff) + data_min;
        end
      end

      iterations=iterations-1;

    end
else if nargin==2
    % E-Step
  assignment = [];
  % assign each datapoint to the closest centroid

  
  for d=1:length(data(:,1))
      curData=repmat(data(d,:),[k 1]);
      diff=sum((curData-centroid).^2,2);
      [minValue minIndex]=min(diff);
      curAssignment=minIndex;
      assignment=[assignment;curAssignment];
  end


  % for the stoppingCriterion
  oldPositions = centroid;

  % M-Step
  % recalculate the positions of the centroids
  centroid = zeros(k, data_dim);
  pointsInCluster = zeros(k, 1);
  
  for d = 1: length(assignment);
    centroid( assignment(d),:) = centroid( assignment(d),:)+data(d,:);
    pointsInCluster( assignment(d), 1 )=pointsInCluster( assignment(d), 1 )+1;
  end
  
  

  for c = 1: k;
    if( pointsInCluster(c, 1) ~= 0)
      centroid( c , : ) = centroid( c, : ) / pointsInCluster(c, 1);
    else
      % set cluster randomly to new position
      centroid( c , : ) = (rand( 1, data_dim) .* data_diff) + data_min;
    end
  end

  %stoppingCriterion
  pos_diff = sum (sum( (centroid - oldPositions).^2 ) );     
    end
end