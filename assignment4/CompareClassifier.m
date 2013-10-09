function [ accuracy1, accuracy2, p_value ] = CompareClassifier( Ypredict1,Ypredict2, Ytest, crossSetLabel,isTwoTail )
k = max(crossSetLabel);
acc1 = zeros(k, 1);
acc2 = zeros(k, 1);
for i = 1:k
    index = crossSetLabel == i;
    n = sum(index);
    y =  Ytest(index);
    acc1(i) = sum(y == Ypredict1(index)) / n;
    acc2(i) = sum(y == Ypredict2(index)) / n;
end
accuracy1 = mean(acc1);
accuracy2 = mean(acc2);
acc_diff = acc1 - acc2;
mean_acc_diff = accuracy1 - accuracy2;
s = (acc_diff - mean_acc_diff)' * (acc_diff - mean_acc_diff) / (k - 1);
t_value = abs(mean_acc_diff * sqrt(k) / sqrt(s));
p_value = 1 - tcdf(t_value, k - 1);
if isTwoTail
    p_value = p_value * 2;
end
end

