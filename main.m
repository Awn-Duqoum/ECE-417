% ECE 417 - Project
clear all; close all; clc;

img_size = [256, 256];
m = 5; 

% Create the speckle pattern 
A = 0.5*randn(img_size) + 1i*0.5*randn(img_size);
A = abs(A);

% Create our superimposeed white squre object
A(50:150, 50:150) = m * A(50:150, 50:150);

% Show the resules along with horizontal cut
DisplayImage(abs(A));

% Edge Enhancment
output_image = imadjust(EdgeEnhancement(A));

% Show the resules along with horizontal cut
DisplayImage(output_image);

%% Example #2 - Real Image
clear all; close all; clc;

% Load the image and convert it to grayscale
img = rgb2gray(imread('test.png'));

% Make sure the image is in the right format
img = abs(double(imresize(img, 2.^floor(log(size(img))/log(2)))));

% Show the resules along with horizontal cut
DisplayImage(img);

% Edge Enhancment
output_image = imadjust(EdgeEnhancement(img, 2));

% Show the resules along with horizontal cut
DisplayImage(output_image);


%% Part 2 - Edge Dtection with Geodesic Active Contour
% Compute the gradient of the image
[Xx,Xy] = imgradientxy(output_image);

% Compute g
p = 1; % Recommend by paper
g = 1./(1 + (abs(Xx)+abs(Xy))^p);
[Gmag,~] = imgradient(g);

% Define the starting Surface evaluated at level 0 
u = zeros(size(output_image));
for i = 1:size(output_image,1)
    for j = 1:size(output_image,2)
        if( i == 1 || j == 1 || i == size(output_image,1) || j == size(output_image,2))
            u(i,j) = 1;
        end
    end
end
u_old = u;
u_new = u;

% Define loop constants
c = 0.25; % Constant Erosion Parameter
delta = 0.001; % Learning Rate
beta = 100; % Random starting point

% Preform itterations
figure
while(beta > 0)
    % Compute parameters
    [Umag,~] = imgradient(u_new);
    norm_U = norm(Umag);
    k = imdiv(Umag/norm_U);
    b2 = trace(Gmag'*(Umag/norm_U))*norm_U;
    % Update image
    for i = 1:size(u_new, 1)
        for j = 1:size(u_new, 2)
            beta = dot(g(i,j),(k(i,j)+c))*(norm_U) + b2;
            u_new(i,j) = u_old(i,j) + delta * beta;  
        end
    end
    % Update itterations
    u_old = u_new;
    % Output image 
    imshow(u_new, [])
end