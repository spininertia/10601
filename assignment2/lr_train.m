function model = lr_train( Xtrain, Ytrain)
%LR_TRAIN Summary of this function goes here

model.num_feature = size(Xtrain, 2);
lambda = 0;
alpha = 0.1;
num_sample = size(Xtrain, 1);
epsilon = 1e-2;

w = rand(model.num_feature, 1) - 0.5;

tmp_lcl = reg_lcl(Xtrain, Ytrain, w, lambda);
round = 1;
while 1
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
    fprintf('round %d: lcl = %f\n', round, lcl);
    round = round+1;
end


model.w = w;
model.alpha = alpha;
model.lambda = lambda;

end

