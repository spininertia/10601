function Pred_per = perceptron_test(model, Xtest)
% this function test the voted perceptron on test set

pred = Xtest * model.v';
pred(pred > 0) = 1;
pred(pred <= 0) = -1;
Pred_per =  pred * model.c;
Pred_per(Pred_per > 0) = 1;
Pred_per(Pred_per <= 0) = 0;

end

