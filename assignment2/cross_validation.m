function [ acc ] = cross_validation( func_train, func_test, X, Y, param, fold )
%CROSS_VALIDATION Summary of this function goes here
%   Detailed explanation goes here
acc = 0;
partition = gen_cv_partition(length(Y), fold);

for i = 1:fold
    train_index = partition.train_indices{i};
    test_index = partition.test_indices{i};
    model = func_train(X(train_index, :), Y(train_index), param);
    pred = func_test(model, X(test_index, :));
    acc = acc + sum(Y(test_index) == pred) / length(test_index);
end

acc = acc / fold;

end

