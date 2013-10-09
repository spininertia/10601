function run_confInterval_heldout( Xtrain, Ytrain, k)
    instanceLabel = PartitionHeldOut(size(Xtrain, 1), k);
    Ypredict = TrainHeldOut(Xtrain, Ytrain, instanceLabel);
    [~, lowerInterval, upperInterval] = ConstructInterval(Ypredict, Ytrain(instanceLabel), 0.95);
    fprintf('k = %d: 0.95, [%f - %f]\n', k, lowerInterval, upperInterval)

    [~, lowerInterval, upperInterval] = ConstructInterval(Ypredict, Ytrain(instanceLabel), 0.99);
    fprintf('k = %d: 0.99, [%f - %f]\n', k,  lowerInterval, upperInterval)
end

