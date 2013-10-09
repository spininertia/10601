function [ Ypredict1 ] = TrainHeldOut1( Xtrain, Ytrain, testInstanceLabel )
%TRAINHELDOU Summary of this function goes here
%   Detailed explanation goes here
    Ypredict1 = TrainHeldOut0(Xtrain, Ytrain, testInstanceLabel, @lr_train, @lr_test);

end

