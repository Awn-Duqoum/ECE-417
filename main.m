% ECE 417 - Project
close all; clear all; clc;
img_size = [250, 250];
m = 5; 

% Create the speckle pattern 
A = abs(0.5*randn(img_size) + i*0.5*randn(img_size));

% Create our superimposeed white squre object
A(45:55  , 50:150) = m * A(45:55  , 50:150);
A(50:150 , 45:55 ) = m * A(50:150 , 45:55 );
A(145:155, 50:150) = m * A(145:155, 50:150);
A(50:150 ,145:155) = m * A(50:150 ,145:155);

% Show the resules along with magnitude of one of the rows
figure;
subplot(1,2,1)
imshow(abs(A))
axis on
subplot(1,2,2)
plot(abs(A(100,:)))
xlabel("Pixel")
ylabel("Amplitude")

%%
X = 0;% Somehow get data

X = log(X);

[~,H,V,D] = swt2(X,N,'haar');