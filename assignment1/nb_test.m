function Pred_nb = nb_test( model, Xtest )
%this function test the naive bayes classifier on test dataset

num_test = size(Xtest, 1);
prob = zeros(num_test, model.num_class);


for i = 1:num_test
    feature = [Xtest(i, :) > 0; Xtest(i, :) == 0]';
    for j = 1:model.num_class
        post = reshape(model.posterior(j, :, :), [model.num_feature, 2]);
        post = sum(post .* feature, 2);
        prob(i,j) = sum(log(post)) + log(model.prior(j));
    end
end

[~, Pred_nb] = max(prob, [], 2);
Pred_nb = Pred_nb - 1;

end

