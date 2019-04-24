function [ ] = DisplayImage( X, row )
    % This function displays an image along with a horizontal cut
    % If no row to cut at is provided a default value of 100 is used
    if(nargin < 2)
        row = 100;
    end
    
    figure;
    subplot(2,1,1);
    imshow(X, []);
    subplot(2,1,2);
    plot(X(row,:));
    ylabel("Amplitude");
    xlabel("Pixel");

end

