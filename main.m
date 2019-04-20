% ECE 417 - Project
clear all; close all; clc;

img_size = [256, 256];
m = 5; 

% Create the speckle pattern 
A = 0.5*randn(img_size) + 1i*0.5*randn(img_size);
A = abs(A);

% Create our superimposeed white squre object
A(50:150, 50:150) = m * A(50:150, 50:150);

% Show the resules along with magnitude of one of the rows
%     figure;
%     subplot(2,1,1)
%     imshow(A, [])
%     axis on
%     subplot(2,1,2)
%     plot(abs(A(100,:)))
%     xlabel("Pixel")
%     ylabel("Amplitude")

% Edge Enhancment 
output_image = EdgeEnhancement(A);

figure
subplot(2,1,1)
imshow(output_image, []) 
subplot(2,1,2)
plot(output_image(100,:))