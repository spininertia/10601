function [ Pred_lr ] = lr_test( model, Xtest )
% test lr model on test set
Xtest = full(Xtest);
threshold = 0.5;
pred = sigmoid(Xtest * model.w);
Pred_lr = pred > threshold;
end

