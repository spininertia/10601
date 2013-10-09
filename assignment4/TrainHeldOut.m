function [ Ypredict ] = TrainHeldOut( Xtrain, Ytrain, testInstanceLabel)
   model = nb_train(Xtrain(~testInstanceLabel, :), Ytrain(~testInstanceLabel));
   Ypredict = nb_test(model, Xtrain(testInstanceLabel, :));
end

