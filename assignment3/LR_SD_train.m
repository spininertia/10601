function [ model ] = LR_SD_train( Xtrain, Ytrain, alpha, round )

X_mapped = feature_mapping(Xtrain);
num_feature = size(X_mapped, 2);
theta = rand(num_feature, 1);
loss = loss_function(theta, X_mapped, Ytrain);
epsilon = 1e-4;
%fprintf('%f\n', loss)

for i = 1:round
    theta = theta + alpha * X_mapped' * (Ytrain - X_mapped * theta);
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

