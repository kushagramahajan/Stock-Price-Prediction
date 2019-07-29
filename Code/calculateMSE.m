function [ cost ] = calculateMSE( Y,predictions )
    
    cost = ((predictions - Y)' * (predictions - Y)) / ( length(Y));
    
end
