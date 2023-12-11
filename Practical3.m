% Load the color image (Lenna.tif)
color_image = imread('Lenna.tif');

% (i) Convert to grayscale
gray_image = rgb2gray(color_image);

% (ii) Obtain four different contrast images
contrast_image1 = gray_image + 50;
contrast_image2 = gray_image - 50;
contrast_image3 = gray_image + 100;
contrast_image4 = gray_image - 100;

% (iii) Plot the result obtained in (i) and (ii)
figure;
subplot(4, 5, 1);
imshow(gray_image);
title('Grayscale Image');

subplot(4, 5, 2);
imshow(contrast_image1);
title('Contrast Image +50');

subplot(4, 5, 3);
imshow(contrast_image2);
title('Contrast Image -50');

subplot(4, 5, 4);
imshow(contrast_image3);
title('Contrast Image +100');

subplot(4, 5, 5);
imshow(contrast_image4);
title('Contrast Image -100');

% (iv) Generate histograms for the contrast images
histogram1 = imhist(contrast_image1);
histogram2 = imhist(contrast_image2);
histogram3 = imhist(contrast_image3);
histogram4 = imhist(contrast_image4);

% (v) Plot the result obtained in (ii) and (iv)
subplot(4, 5, 6);
imhist(gray_image);
title('Histogram Grayscale Image');

subplot(4, 5, 7);
imhist(contrast_image1);
title('Histogram +50');

subplot(4, 5, 8);
imhist(contrast_image2);
title('Histogram -50');

subplot(4, 5, 9);
imhist(contrast_image3);
title('Histogram +100');

subplot(4, 5, 10);
imhist(contrast_image4);
title('Histogram -100');

% (vi) Generate histogram-equalized images for contrast images
equalized_image1 = histeq(contrast_image1);
equalized_image2 = histeq(contrast_image2);
equalized_image3 = histeq(contrast_image3);
equalized_image4 = histeq(contrast_image4);

% (vii) Plot the result obtained in (vi)
subplot(4, 5, 11);
imshow(gray_image);
title('Grayscale Image');

subplot(4, 5, 12);
imshow(equalized_image1);
title('Equalized +50');

% Plot histograms of equalized images
subplot(4, 5, 13);
imshow(equalized_image2);
title('Equalized -50');

subplot(4, 5, 14);
imshow(equalized_image3);
title('Equalized +100');

subplot(4, 5, 15);
imshow(equalized_image4);
title('Equalized +100');

subplot(4, 5, 16);
imhist(gray_image);
title('Histogram Grayscale Image');

subplot(4, 5, 17);
imhist(equalized_image1);
title('Equalized Histogram +50');

subplot(4, 5, 18);
imhist(equalized_image2);
title('Equalized Histogram -50');

subplot(4, 5, 19);
imhist(equalized_image3);
title('Equalized Histogram +100');

subplot(4, 5, 20);
imhist(equalized_image4);
title('Equalized Histogram -100');

sgtitle('LAB 3 - Different Contrast Images, Histogram of Grey Level Images, and Histogram Equalization of Grey Level Images.', 'FontSize', 18, 'FontWeight', 'bold');

