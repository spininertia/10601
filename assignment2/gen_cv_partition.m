function [ partition ] = gen_cv_partition( num_sample, fold )
%GEN_CV_PARTITION Summary of this function goes here
%   Detailed explanation goes here
index = randperm(num_sample);
num_test = int16(num_sample / fold);
for i = 1:fold - 1
    testing{i} = index((i-1)*num_test + 1: i * num_test);
    training{i} = setdiff(index, testing{i});
end
testing{fold} = index((fold-1)*num_test + 1: num_sample);
training{fold} = setdiff(index, testing{fold});
partition.train_indices = training;
partition.test_indices = testing;

end

