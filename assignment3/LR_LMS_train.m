function [ model ] = LR_LMS_train( Xtrain, Ytrain, alpha, round )
X_mapped = feature_mapping(Xtrain);
num_feature = size(X_mapped, 2);
num_sample = length(Ytrain);
theta = rand(num_feature, 1);
loss = loss_function(theta, X_mapped, Ytrain);
epsilon = 1e-4;
%fprintf('%f\n', loss)

for i = 1:round
    index = randperm(num_sample);
    for j = 1 : num_sample
      x = X_mapped(index(j), :);
      y = Ytrain(index(j));
      theta = theta + alpha * (y - x * theta) * x';
        
    end
    tmp_loss = loss_function(theta, X_mapped, Ytrain);
    diff = abs(tmp_loss - loss);
    %fprintf('%f\n', tmp_loss)
    if diff < epsilon
        break
    end
end

model.theta = theta;
model.alpha = alpha;
model.round = round;
model.epsilon = epsilon;
model.num_feature = num_feature;

end

