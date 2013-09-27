function [ model ] = LR_NE_train( Xtrain, Ytrain )

X = feature_mapping(Xtrain);
model.theta = pinv(X'*X)*X'*Ytrain;

end

