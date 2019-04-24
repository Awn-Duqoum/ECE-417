function [ X_ ] = EdgeEnhancement( X, ittr)
    % Determine the scales we can use
    img_size = size(X);
    N = min(wmaxlev(img_size(1),'haar'), wmaxlev(img_size(2),'haar'));
    % Log 
    X = log(X);
    % SWT2
    [~,H,V,D] = swt2(X,N,'haar');
    %Abs
    H = abs(H);
    V = abs(V);
    D = abs(D);
    % Normalization to maximum
    for i = 1:N        
        H(:,:,i) = normalize(H(:,:,i));
        V(:,:,i) = normalize(V(:,:,i));
        D(:,:,i) = normalize(D(:,:,i));
    end
    % Loop
    if(nargin < 2)
        ittr = 3; % The paper recommends 3 iterations
    end
    desired_scale = N; % Use the all allowable scales
    output_image = ones(img_size);
    for j = 1:ittr
        for i = 1:desired_scale
            % Point-wise maximum 
            max_scale = max(max(H(:,:,i), V(:,:,i)), D(:,:,i));
            output_image = output_image .* max_scale;
        end
    end
    X_ = output_image;
end

