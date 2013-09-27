function [ loss ] = loss_function( theta, X, y )
loss = (X * theta - y)' * (X * theta - y) / 2;
end

