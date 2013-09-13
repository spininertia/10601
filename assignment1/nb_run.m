function [ output_args ] = nb_run( Xtrain, Ytrain, Xtest, Ytest )
% train and test Naive Bayes classifier
model= nb_train(Xtrain, Ytrain);
Pred_nb = nb_test(model, Xtest);
save('Pred_nb.mat', 'Pred_nb')

tp = sum((Pred_nb == 1) & (Ytest == 1));
fp = sum((Pred_nb == 1) & (Ytest == 0));
tn = sum((Pred_nb == 0) & (Ytest == 0));
fn = sum((Pred_nb == 0) & (Ytest == 1));

precision = tp / (tp + fp);
recall = tp / (tp + fn);
accuracy = (tp + tn) / (tp + fp + tn + fn);

fprintf('P:%.3f, R:%.3f, A:%.3f\n', precision, recall, accuracy);

end

