function [ Ypredict2 ] = TrainHeldOut2( Xtrain, Ytrain, testInstanceLabel )
%TRAINHELDOUT2 Summary of this function goes here
%   Detailed explanation goes here

Ypredict2 = TrainHeldOut0(Xtrain, Ytrain, testInstanceLabel, @nb_train, @nb_test);

end

