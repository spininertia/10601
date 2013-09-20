function [ Pred_lr ] = lr_test( model, Xtest )
% test lr model on test set
threshold = 0.5;
pred = sigmoid(Xtest * model.w);
logical = pred > threshold;
pred(logical) = 1;
pred(logical) = 0;
Pred_lr = pred;

end

