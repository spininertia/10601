function [ testInstanceLabel ] = PartitionHeldOut( size, k )
    testSize = int16(size / k);
    index = randperm(size);
    testInstanceLabel = index <= testSize;
end

