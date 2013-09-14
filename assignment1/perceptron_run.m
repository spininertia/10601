function perceptron_run(Xtrain, Ytrain, Xtest, Ytest)
% train, test and evaluate voted perceptron algortihm
model= perceptron_train(Xtrain, Ytrain);
Pred_per = perceptron_test(model, Xtest);
save('Pred_per.mat', 'Pred_per')

tp = sum((Pred_per == 1) & (Ytest == 1));
fp = sum((Pred_per == 1) & (Ytest == 0));
tn = sum((Pred_per == 0) & (Ytest == 0));
fn = sum((Pred_per == 0) & (Ytest == 1));

precision = tp / (tp + fp);
recall = tp / (tp + fn);
accuracy = (tp + tn) / (tp + fp + tn + fn);

fprintf('P:%.3f, R:%.3f, A:%.3f\n', precision, recall, accuracy);

end

