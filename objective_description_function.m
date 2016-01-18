function [number_of_objectives, number_of_decision_variables, min_range_of_decesion_variable, max_range_of_decesion_variable] = objective_description_function(param)
number_of_objectives=param.m;
[M N]=size(param.data);
number_of_decision_variables=M;

min_range_of_decesion_variable=repmat(1,[1 M]);
max_range_of_decesion_variable=repmat(M,[1 M]);
end



