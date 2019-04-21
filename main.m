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
DisplayImage(abs(output_image));
