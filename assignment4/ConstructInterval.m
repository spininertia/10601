function [ Accuracy, lowerInterval, upperInterval ] = ConstructInterval( Ypredict, Ytest, confLevel )

num_test = length(Ytest);
Accuracy = sum(Ypredict == Ytest) / num_test;
interval = norminv(confLevel + (1 - confLevel) / 2);
se = sqrt(Accuracy * (1 - Accuracy) / num_test);
lowerInterval = Accuracy - interval * se;
upperInterval = Accuracy + interval * se;

end

