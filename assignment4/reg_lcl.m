function [ lcl ] = reg_lcl( X, y, w, lambda)
% regularized likelihood function for logistic regression

lcl = sum(y .* log(sigmoid(X * w)) + (1 - y) .* log(1 - sigmoid(X * w))) ...
    - lambda * (w' * w);
end

