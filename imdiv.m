function [ D ] = imdiv( Img )
    % Computes the divergance of an image 
    Ix = diff([Img Img(:, end)]')';
    Iy = diff([Img; Img(end, :)]);
    [X, Y] = meshgrid(1:size(Img, 2), 1:size(Img, 1));
    D = divergence(X, Y, Ix, Iy);
end
    