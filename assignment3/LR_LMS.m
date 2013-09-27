function LR_LMS( Xtrain, Ytrain, Xtest, Ytest )
%LR_STEEPESTDESCENT Summary of this function goes here
%   Detailed explanation goes here
    model = LR_LMS_train(Xtrain, Ytrain, 5*1e-5, 2000);
    Ypred_LMS = LR_test(model, Xtest);
    save('Ypred_LMS.mat', 'Ypred_LMS')
    error = compute_error(Ypred_LMS, Ytest);
    fprintf('Error = %.3f\n', error)
end

