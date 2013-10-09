function [ crossSetLabel ] = PartitionCrossSet( size, k )
   crossSetLabel = randperm(size);
   crossSetLabel = mod(crossSetLabel, k) + 1;
end

