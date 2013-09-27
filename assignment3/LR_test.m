function [ y ] = LR_test( model, Xtest )
   X_mapped = feature_mapping(Xtest);
   y = X_mapped * model.theta;
end

