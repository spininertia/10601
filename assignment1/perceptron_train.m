function model = perceptron_train( Xtrain, Ytrain )
%this function trains the model of a voted perceptron classifier

Ytrain(Ytrain == 0) = -1;
model.num_feature = size(Xtrain, 2);
model.num_class = 2; 
model.v = [];
model.c = [];
model.T = 5;
model.k = 1;

v = zeros(1, model.num_feature);
c = 0;
model.v = v;

for round = 1:model.T
    for i = 1:size(Xtrain, 1);
        x = Xtrain(i, :);
        y = Ytrain(i);
        if y * (x * v') > 0
            c = c + 1;
        else
            model.c = [model.c; c];
            v = v + y * x;
            model.v = [model.v; v];
            c = 0;
        end
    end
end
model.c = [model.c; c];

disp('perceptron formed..')

end

