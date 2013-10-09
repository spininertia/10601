function [ Ypredict ] = TrainHeldOut0( Xtrain, Ytrain, testInstanceLabel, trainFunc, testFunc )
   model = trainFunc(Xtrain(~testInstanceLabel, :), Ytrain(~testInstanceLabel));
   Ypredict = testFunc(model, Xtrain(testInstanceLabel, :));
end

