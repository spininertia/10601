load handout.mat
alpha = 0.001;
lambdas = [0 1 2 4 8];
lambda = 1;
param.alpha = alpha;
acc = zeros(size(lambdas));
for i = 1:length(lambdas)
    param.lambda = lambdas(i);
    acc(i) = cross_validation(@lr_train_param, @lr_test, Xtrain, Ytrain, param, 5);
end
alpha
lambdas
acc