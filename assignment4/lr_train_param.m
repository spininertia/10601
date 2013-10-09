function model = lr_train_param( Xtrain, Ytrain, param)
%LR_TRAIN Summary of this function goes here

model.num_feature = size(Xtrain, 2);
num_sample = size(Xtrain, 1);
epsilon = 1e-4;
alpha = param.alpha;
lambda = param.lambda;

w = zeros(model.num_feature, 1);

tmp_lcl = reg_lcl(Xtrain, Ytrain, w, lambda);
disp(tmp_lcl)
round = 1;
while round < 500
    index = randperm(num_sample);
    for i = 1 : num_sample
        x = Xtrain(index(i), :);
        y = Ytrain(index(i));
        w = w + alpha * ((y - sigmoid(x * w)) * x' - 2 * lambda * w);
    end
    lcl = reg_lcl(Xtrain, Ytrain, w, lambda);
    diff = abs(lcl - tmp_lcl);
    if diff < epsilon
        break
    end
    tmp_lcl = lcl;
    fprintf('lambda: %f, round %d: lcl = %f\n', lambda, round, lcl);
    round = round+1;
end


model.w = w;
model.alpha = alpha;
model.lambda = lambda;

end
