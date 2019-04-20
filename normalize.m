function [ X_] = normalize( X )
    
    if( length(X(X>3*std2(X)))/length(X(:)) > 0.01)
        % Dist has a feature 
        %a = sort(X(:));
        %X_ = X ./ a(floor(length(X(:))*0.95));
        lowhigh = stretchlim(X, 0.1);
        X_ = imadjust(X,lowhigh,[0 1]);
        X_(X_>1) = 1;
    else
        % Dist is not heavy tailed 
        X_ = X ./ 3*std2(X);
        X_(X_>1) = 1;       
    end

end