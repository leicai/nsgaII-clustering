function [solutions objs]=nsga2Clustering(pop,gen,param)

if nargin < 3
    error('MyMOCK: Please enter the population size and number of generations as input arguments.');
end
% Both the input arguments need to of integer data type
if isnumeric(pop) == 0 || isnumeric(gen) == 0
    error('Both input arguments pop and gen should be integer datatype');
end
% Minimum population size has to be 20 individuals
if pop < 20
    error('Minimum population for running this function is 20');
end
if gen < 5
    error('Minimum number of generations is 5');
end
% Make sure pop and gen are integers
pop = round(pop);
gen = round(gen);


[M, V, min_range, max_range] = objective_description_function(param);

[chromosome param]= initialize_variables(pop,param);

Z=initialize_ideaPoint(chromosome,param.m);

% chromosome=getNormalizedPopulation(chromosome,Z,param);

chromosome=non_domination_sort_mod(chromosome, M, V);
mum=0.1;

for i = 1 : gen

    pool = round(pop/2);
    tour = 2;

    parent_chromosome = tournament_selection(chromosome, pool, tour);


    offspring_chromosome = ...
        genetic_operator(parent_chromosome,mum,param);
    
    Z=updateReference(Z,offspring_chromosome,param);
    
    chromosome=chromosome(:,1:M+V);
%     offspring_chromosome=getNormalizedPopulation(offspring_chromosome,Z,param);
    
    Union=[chromosome;offspring_chromosome];
    
    Union = ...
        non_domination_sort_mod(Union, M, V);

    chromosome = replace_chromosome(Union, M, V, pop);

    disp (['The ' num2str(i) 'th' ' generation.'] );
end
chromosome=chromosome(chromosome(:,V+M+1)==1,:);

solutions=chromosome(:,1:V);
objs=chromosome(:,V+1:V+M);
 


    
