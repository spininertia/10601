function [ Ypredict ] = TrainCrossSet( Xtrain, Ytrain, crossSetLabel )
Ypredict = zeros(size(Ytrain));
fold = max(crossSetLabel);
for i = 1:fold
    tr_index = crossSetLabel ~= i;
    te_index = crossSetLabel == i;
    model = nb_train(Xtrain(tr_index, :), Ytrain(tr_index));
    Ypredict(te_index) = nb_test(model, Xtrain(te_index, :));
end
end

