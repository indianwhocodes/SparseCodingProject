
function [normalizedData,normalizationFactor] = normalize(data, dimension)

if(nargin<2), 
    dimension = 1;
end

normalizationFactor = sqrt(sum(conj(data).*data, dimension));
resizeArray = ones(1, ndims(data));
resizeArray(dimension) = size(data, dimension);
normalizedData =  data ./ repmat(normalizationFactor, resizeArray);