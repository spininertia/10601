function Pred_nb = nb_test( model, Xtest )
%this function test the naive bayes classifier on test dataset

num_test = size(Xtest, 1);
prob = zeros(num_test, model.num_class);

for i = 1:num_test
    feature = Xtest(i, :);
    for j = 1:model.num_class
        tmp = 0;
        for k = 1:model.num_feature
            if feature(k) > 0
                tmp = tmp + log(model.posterior(k, j));
            else
                tmp = tmp + log(1 - model.posterior(k, j));
            end
        end
        prob(i,j) = tmp + log(model.prior(j));
    end
end

[~, Pred_nb] = max(prob, [], 2);
Pred_nb = Pred_nb - 1;

end

