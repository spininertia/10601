function [ acc1, acc2, p_value ] = run_compare_cross( Xtrain, Ytrain, isTwoTail )
k = 10;
num_sample = size(Xtrain, 1);
crossSetLabel = PartitionCrossSet(num_sample,k);
Ypredict1 = TrainCrossSet1(Xtrain, Ytrain, crossSetLabel);
Ypredict2 = TrainCrossSet2(Xtrain, Ytrain, crossSetLabel);
Ytest = Ytrain;
[acc1, acc2, p_value] = CompareClassifier(Ypredict1,Ypredict2, Ytest, crossSetLabel,isTwoTail);

end

