% Read in the image
img = imread('temple.jpeg');
figure;
imshow(img);
title('source image');

% Perform gamma correction
gamma = 0.5;
img_corrected = double(img) .^ gamma;
img_corrected = uint8(255 * mat2gray(img_corrected));

% Display the original and corrected images
%subplot(2,2,1);
%figure, imshow(img);
%title('Original Image');
%subplot(2,2,2);
figure;
imshow(img_corrected);
title('Brightnee Adaption Image');

% Load the image

% Convert the image to double precision
I = im2double(img_corrected);

% Separate the color channels
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

% Calculate the luminance of the image
L = rgb2gray(I);

% Set the parameters for non-linear remapping
gamma = 1.5;
alpha = 0.3;
beta = 0.6;

% Apply the non-linear remapping
L_new = (L .^ gamma) * alpha;
R_new = R .* (L_new ./ L) .^ beta;
G_new = G .* (L_new ./ L) .^ beta;
B_new = B .* (L_new ./ L) .^ beta;

% Re-combine the color channels
I_new = cat(3, R_new, G_new, B_new);

% Scale the values to the range [0,1]
I_newx = I_new / max(I_new(:));

% Display the result
figure;
imshow(I_newx);
title('Contrast Image');


% Load the image
%Img1 = imread('temple.jpeg');

% Convert the image to double precision
%Img1 = im2double(I_newx);
Img1 = I_newx;

% Separate the color channels
R = Img1(:,:,1);
G = Img1(:,:,2);
B = Img1(:,:,3);

% Calculate the mean of each color channel
R_mean = mean(R(:));
G_mean = mean(G(:));
B_mean = mean(B(:));

% Calculate the scaling factors for each color channel
R_scale = G_mean / R_mean;
B_scale = G_mean / B_mean;

% Apply color level remapping
R_new = R .* R_scale;
B_new = B .* B_scale;

% Re-combine the color channels
I_new = cat(3, R_new, G, B_new);

% Scale the values to the range [0,1]
I_new = I_new / max(I_new(:));

% Display the result
figure;
imshow(I_new);
title('color cast image');

img = I_newx;
% Separate color channels
red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);

% Calculate means for each channel
meanRed = mean(red(:));
meanGreen = mean(green(:));
meanBlue = mean(blue(:));

% Calculate scaling factors for each channel
scalingFactorRed = mean(green(:))/mean(red(:));
scalingFactorBlue = mean(green(:))/mean(blue(:));

% Apply color level remapping
redNew = red*scalingFactorRed;
blueNew = blue*scalingFactorBlue;

% Combine the color channels to form the corrected image
correctedImage = cat(3, redNew, green, blueNew);

% Display the result
figure;
imshow(correctedImage);
title('o/p img');





