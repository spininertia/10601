function [ Ypredict1 ] = TrainCrossSet2( Xtrain, Ytrain, crossSetLabel )

Ypredict1 = TrainCrossSet0(Xtrain, Ytrain, crossSetLabel, @nb_train, @nb_test);

end

