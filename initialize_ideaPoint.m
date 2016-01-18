function f=initialize_ideaPoint(chromosome,number_objective)
    [M N]=size(chromosome);
    objects=chromosome(:,N-number_objective+1:N);
    f=min(objects);
end