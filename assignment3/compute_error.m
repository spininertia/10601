function [ error ] = compute_error( pred, ytest )
%COMPUTE_ERROR Summary of this function goes here
%   Detailed explanation goes here
    error = norm(pred - ytest);
end

