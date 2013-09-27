load Assignment4-handout.mat
round = [1 2 5 10 20 50 100];
LMS_error = zeros(size(round));
SD_error = zeros(size(round));
alpha = 5 * 1e-5;
for i = 1:length(round)
    model_sd = LR_SD_train(Xtrain, Ytrain, alpha, round(i));
    pred_sd = LR_test(model_sd, Xtest);
    SD_error(i) = compute_error(pred_sd, Ytest);
    
    model_lms = LR_LMS_train(Xtrain, Ytrain, alpha, round(i));
    pred_lms = LR_test(model_lms, Xtest);
    LMS_error(i) = compute_error(pred_lms, Ytest);
end
model_ne = LR_NE_train(Xtrain, Ytrain);
pred_ne = LR_test(model_ne, Xtest);
NE_error = compute_error(pred_ne, Ytest);
NE_error = repmat(NE_error, size(round));
figure
hold on
plot(round, NE_error, 'g')
plot(round, SD_error, 'r')
plot(round, LMS_error, 'b')
legend('Normal Equation', 'Steepest Descent', 'Stochastic Gradient Descent')
xlabel('round')
ylabel('error')
