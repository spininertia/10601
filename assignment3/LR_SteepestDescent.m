function LR_SteepestDescent( Xtrain, Ytrain, Xtest, Ytest )
%LR_STEEPESTDESCENT Summary of this function goes here
%   Detailed explanation goes here
    model = LR_SD_train(Xtrain, Ytrain, 5 * 1e-5, 2000);
    Ypred_SD = LR_test(model, Xtest);
    save('Ypred_SD.mat', 'Ypred_SD');
    error = compute_error(Ypred_SD, Ytest);
    fprintf('Error = %.3f\n', error)
end

