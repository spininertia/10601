function [ Ypredict ] = TrainCrossSet0( Xtrain, Ytrain, crossSetLabel, trainFunc, testFunc )
Ypredict = zeros(size(Ytrain));
fold = max(crossSetLabel);
for i = 1:fold
    tr_index = crossSetLabel ~= i;
    te_index = crossSetLabel == i;
    model = trainFunc(Xtrain(tr_index, :), Ytrain(tr_index));
    Ypredict(te_index) = testFunc(model, Xtrain(te_index, :));
end
end

