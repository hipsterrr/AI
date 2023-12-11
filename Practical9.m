% Write and execute the MATLAB Code to learn the region growing 
% based image segmentation.

% Icolor = imread('G:\YCCE-27-11-2021\DIP-2021-2022\DIP-PR\Lenna.tif');
Icolor = imread('Weld.jpg');

% (i)   Convert the given image to grey level image and visualize the 
% obtained image.

Igrey = rgb2gray(Icolor);
SZIgrey = size(Igrey);
Rowpixels = SZIgrey(1);
Columnpixels = SZIgrey(2);

I = Igrey;
% figure(1), imshow(Igrey);

% (ii)  Generate the histogram of the obtained grey level image.
[counts,bins] = imhist(I); 

% figure(2), imhist(I);

S = 255; % Single seed value
T = 65; % T is a scalar value 

% rgis function call
[IO, NR , SI , TI ] = rgis(I, S, T);

% (iv)	Plot the results obtained ((a) Original grey level image, 
% (b) histogram, (c) Seed points image, (d) Binary image showing all 
% the pixels (in white) that passed the threshold test, and 
% (e) Result after all the pixels in (d) were analyzed for 
% 8-connectivity to the seed points).

figure;
subplot(2,3,1);
imshow(Icolor);
title('Original Color Image');
subplot(2,3,2);
imshow(uint8(I));
title('Original GL Image');
subplot(2,3,3);
imhist(I);
title('Histogram of GL Image');
subplot(2,3,4);
imshow(SI);
title('Seed Points Image');
subplot(2,3,5);
imshow(TI);
title('Binary Image Passed T.T.');
subplot(2,3,6);
imshow(IO);
title('Segmented Image');
