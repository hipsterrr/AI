% Load the color image (Lenna.tif)
color_image = imread('Lenna.tif');

% (i) Convert to grayscale
gray_image = rgb2gray(color_image);

% (ii) Obtain the negative image
negative_image = 255 - gray_image;

% (iii) Perform contrast stretching
% You can use imadjust to perform contrast stretching.
contrast_stretched_image = imadjust(gray_image);

% (iv) Perform intensity level slicing
% Let's say you want to enhance the intensity values in a certain range, e.g., [50, 150].
intensity_sliced_image = gray_image;
intensity_sliced_image(gray_image >= 50 & gray_image <= 150) = 255;
intensity_sliced_image(gray_image < 50 | gray_image > 150) = 0;

% (v) Perform bit-plane slicing
% Let's say you want to perform bit-plane slicing on the gray image.
bit_planes = zeros(size(gray_image, 1), size(gray_image, 2), 8);
for i = 1:8
    bit_plane = bitget(gray_image, i);
    bit_planes(:,:,i) = bit_plane * 255;
end

% Plot all the results in one figure
figure;

subplot(3, 5, 1);
imshow(color_image);
title('Original Color Image');

subplot(3, 5, 2);
imshow(gray_image);
title('Grayscale Image');

subplot(3, 5, 3);
imshow(negative_image);
title('Negative Image');

subplot(3, 5, 4);
imshow(contrast_stretched_image);
title('Contrast Stretched Image');

subplot(3, 5, 5);
imshow(intensity_sliced_image);
title('Intensity Sliced Image','FontSize', 13, 'FontWeight', 'bold');

for i = 1:8
    subplot(3, 5, 5 + i);
    imshow(bit_planes(:,:,i));
    title(['Bit-Plane ', num2str(i)]);
end

sgtitle('LAB 2 - Grey Level Image, Contrast Stretching, Intensity Level Slicing, and Bit-Plane Slicing', 'FontSize', 18, 'FontWeight', 'bold');
