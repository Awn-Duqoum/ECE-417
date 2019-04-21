function [ X_] = normalize( X, feature )
    
    % If the image we are dealing with has no features (i.e vessels)
    % This method will work well, otherwise we will need to use 
    % another method, by deault assume no feature
    if(nargin < 2)
        feature = false;
    end
    
    if( feature == false)
        X_ = X ./ 3*std2(X);
        X_(X_>1) = 1;     
    else 
        X_ = X ./ max(max(x));
    end
end