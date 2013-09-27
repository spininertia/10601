function [ output_args ] = LR_NormalEquation( Xtrain, Ytrain, Xtest, Ytest )
%LR_NORMALEQUATION Summary of this function goes here
%   Detailed explanation goes here
    model = LR_NE_train(Xtrain, Ytrain);
    Ypred_NE = LR_test(model, Xtest);
    save('Ypred_NE.mat', 'Ypred_NE')
    error = compute_error(Ypred_NE, Ytest);
    fprintf('Error = %.3f\n', error)
end

