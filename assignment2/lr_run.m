function lr_run( Xtrain, Ytrain, Xtest, Ytest )
% train lr model and test the model on test set
model = lr_train(Xtrain, Ytrain);
Pred_lr = lr_test(model, Xtest);
save('Pred_lr.mat', 'Pred_lr')

tp = sum((Pred_lr == 1) & (Ytest == 1));
fp = sum((Pred_lr == 1) & (Ytest == 0));
tn = sum((Pred_lr == 0) & (Ytest == 0));
fn = sum((Pred_lr == 0) & (Ytest == 1));

precision = tp / (tp + fp);
recall = tp / (tp + fn);
accuracy = (tp + tn) / (tp + fp + tn + fn);

fprintf('P:%.3f, R:%.3f, A:%.3f\n', precision, recall, accuracy);

end

