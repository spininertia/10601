function [ Ypredict1 ] = TrainCrossSet1( Xtrain, Ytrain, crossSetLabel )

Ypredict1 = TrainCrossSet0(Xtrain, Ytrain, crossSetLabel, @lr_train, @lr_test);

end

