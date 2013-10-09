function [ accuracy1, accuracy2, p_value ] = run_compare_heldout( Xtrain, Ytrain, isTwoTail )
num_sample = size(Xtrain, 1);
k1 = 5;
k2 = 10;
testInstanceLabel = PartitionHeldOut(num_sample, 5);
Ypredict1 = TrainHeldOut1(Xtrain, Ytrain, testInstanceLabel);
Ypredict2 = TrainHeldOut2(Xtrain, Ytrain, testInstanceLabel);
crossSetLabel = PartitionCrossSet(num_sample / k1, k2);
Ytest = Ytrain(testInstanceLabel);
[accuracy1, accuracy2, p_value] = CompareClassifier(Ypredict1,Ypredict2, Ytest, crossSetLabel,isTwoTail);
end

