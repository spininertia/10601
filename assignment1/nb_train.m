function model = nb_train( Xtrain, Ytrain )
% This function trains the model of a Naive Bayes Classifier

% record some attributes of the data
model.num_sample = size(Xtrain, 1);
model.num_feature = size(Xtrain, 2);
model.num_class = length(unique(Ytrain));
model.alpha = 1; % laplace smoothing parameter
model.prior = zeros(model.num_class, 1);
model.posterior = zeros(model.num_class, model.num_feature, 2);

count_y = zeros(model.num_class, 1);
count_y_token = zeros(model.num_class, 1);

% calculate prior and posterior
for i = 1:model.num_class
    logical = (Ytrain == (i - 1));
    count_y(i) = sum(logical);
    model.prior(i) = count_y(i) / model.num_sample;
    count_y_token(i) = sum(sum(Xtrain(logical, :)));
    count_x_y = sum(Xtrain(logical, :));
    model.posterior(i, :, 1) = (count_x_y + model.alpha) /...
            (count_y_token(i) + model.num_feature * model.alpha);
    model.posterior(i, :, 2) = 1 - model.posterior(i, :, 1);
end

disp('Naive Bayes trained...')

end

