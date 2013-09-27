function [ X_mapped ] = feature_mapping( X )
% non-linear basis feature mapping
X_mapped = [ones(size(X)) X X.^2 X.^3];

end

