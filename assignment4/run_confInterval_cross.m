function run_confInterval_cross( Xtrain, Ytrain, k)
%RUN_CONFINTERVAL Summary of this function goes here
%   Detailed explanation goes here

    instanceLabel = PartitionCrossSet(size(Xtrain, 1), k);
    Ypredict = TrainCrossSet(Xtrain, Ytrain, instanceLabel);
    [~, lowerInterval, upperInterval] = ConstructInterval(Ypredict, Ytrain, 0.95);
    fprintf('k = %d: 0.95, [%f - %f]\n', k, lowerInterval, upperInterval)

    [~, lowerInterval, upperInterval] = ConstructInterval(Ypredict, Ytrain, 0.99);
    fprintf('k = %d: 0.99, [%f - %f]\n', k,  lowerInterval, upperInterval)

end

