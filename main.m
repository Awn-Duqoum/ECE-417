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
[Gmag,Gdir] = imgradient(output_image);

% Compute g
p = 1; % Recommend by paper
g = 1/(1 + norm(Gmag)^p);

% Define the starting U
u0 = ones(size(output_image));

% Define loop constants
c = 0.5; % Honeslty no idea 
[Umag,~] = imgradient(output_image);
k = imdiv(Umag./norm(Umag));

