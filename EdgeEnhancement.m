function [ X_ ] = EdgeEnhancement( X )
    % Determine the scales we can use
    img_size = size(X);
    N = wmaxlev(img_size(1),'haar');
    % Log 
    X = log(X);
    % SWT2
    [~,H,V,D] = swt2(X,N,'haar');
    %Abs
    H = abs(H);
    V = abs(V);
    D = abs(D);
    % Normalization to maxiumum
    for i = 1:N        
        H(:,:,i) = normalize(H(:,:,i));
        V(:,:,i) = normalize(V(:,:,i));
        D(:,:,i) = normalize(D(:,:,i));
    end
    % Loop
    ittr = 5;
    desired_scale = 6;
    output_image = ones(img_size);
    
    for j = 1:ittr
        for i = 1:desired_scale
           % Pointwise maximum 
           max_scale = max(max(H(:,:,i), V(:,:,i)), D(:,:,i));
           output_image = output_image .* max_scale;
        end
    end
    X_ = output_image;
end

