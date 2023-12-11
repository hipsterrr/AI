% S = imread("Lenna.tif");
% I = im2gray(S);
% I2 = padarray(I,[1 1],0,'both');
% [x,y] = size(I2);
% imshow(I2);

% Load your TIF image
og_image = imread('Lenna.tif');

grayImage = im2gray(og_image);

% Get the size of the image
[rows, cols] = size(grayImage);

% Initialize the zero padded image
zero_padded_image= padarray(grayImage,[1 1],0,'both');

zero_padded_image= double(zero_padded_image);

average_filter_image = zero_padded_image;
weighted_avg_filter_image = zero_padded_image;
min_filetr_image = zero_padded_image;

% Define the size of the average filter kernel
kernel_size = 3;
kernel = [1, 2, 1; 2, 4, 2; 1, 2, 1];
% kernel=double(kernel);
% Iterate over each pixel in the image
for i = 2:(rows - 1)
    for j = 2:(cols - 1)
        % Compute the average value of the neighborhood
        neighborhood = zero_padded_image(i-1:i+1, j-1:j+1);
        
        average_value = mean(neighborhood(:));
        weighted_average = sum(sum(neighborhood .* kernel)) / sum(kernel(:));
        % min_filetr_image

        % Set the corresponding pixel in the filtered image
        average_filter_image(i, j) = average_value;
        weighted_avg_filter_image(i,j) = weighted_average;
    end
end

% Define the neighborhood size (e.g., 3x3)
neighborhood_size = [3, 3];

% Apply the minimum filter
% min_filtered_image = ordfilt2(image, 1, ones(neighborhood_size));
% (3) Min Filter
min_filtered_image = ordfilt2(grayImage, 1, ones(3, 3), 'symmetric');

% (4) Median Filter
median_filtered_image = medfilt2(grayImage, [3, 3]);

% (5) Max Filter
max_filtered_image = ordfilt2(grayImage, 9, ones(3, 3), 'symmetric');

% (B) Sharpening using spatial domain filters
% (1) All Four Versions of Laplacian Filter
laplacian1 = imfilter(grayImage, fspecial('laplacian', 0.2), 'replicate');
laplacian2 = imfilter(grayImage, fspecial('laplacian', 0.4), 'replicate');
laplacian3 = imfilter(grayImage, fspecial('laplacian', 0.6), 'replicate');
laplacian4 = imfilter(grayImage, fspecial('laplacian', 0.8), 'replicate');

% Create the Roberts Cross filter manually
roberts_h = [1, 0; 0, -1];
roberts_v = [0, 1; -1, 0];

% Apply Roberts Cross operators to the grayscale image
roberts_h_image = imfilter(double(grayImage), roberts_h, 'replicate');
roberts_v_image = imfilter(double(grayImage), roberts_v, 'replicate');

% (3) Sobel Operators
sobel_h = fspecial('sobel');
sobel_v = sobel_h';
sobel_h_image = imfilter(double(grayImage), sobel_h, 'replicate');
sobel_v_image = imfilter(double(grayImage), sobel_v, 'replicate');

% (iii) Plot the results for (ii)(A)(1) and (ii)(A)(2)
figure;
subplot(3, 5, 1);
imshow(grayImage, []);
title('Original Image (Gray)');

subplot(3, 5, 2);
imshow(average_filter_image, []);
title('Average Filter');

subplot(3, 5, 3);
imshow(weighted_avg_filter_image, []);
title('Weighted Average Filter');

% (iv) Plot the results for (ii)(A)(3), (ii)(A)(4), and (ii)(A)(5)
subplot(3, 5, 4);
imshow(min_filtered_image, []);
title('Min Filter');

subplot(3, 5, 5);
imshow(median_filtered_image, []);
title('Median Filter');

subplot(3, 5, 6);
imshow(max_filtered_image, []);
title('Max Filter');

% (v) Plot the results for (ii)(B)(1)
subplot(3, 5, 7);
imshow(laplacian1, []);
title('Laplacian Filter 1');

subplot(3, 5, 8);
imshow(laplacian2, []);
title('Laplacian Filter 2');

subplot(3, 5, 9);
imshow(laplacian3, []);
title('Laplacian Filter 3');

subplot(3, 5, 10);
imshow(laplacian4, []);
title('Laplacian Filter 4');

% Add code to plot the results for laplacian2, laplacian3, and laplacian4

% (vi) Plot the results for (ii)(B)(2) and (ii)(B)(3)
subplot(3, 5, 11);
imshow(roberts_h_image, []);
title('Roberts Horizontal');

subplot(3, 5, 12);
imshow(roberts_v_image, []);
title('Roberts Vertical');

subplot(3, 5, 13);
imshow(sobel_h_image, []);
title('Sobal Horizontal');

subplot(3, 5, 14);
imshow(sobel_v_image, []);
title('Sobal Vertical');

sgtitle('LAB 4 - Image Filtering Operations of Smoothing and Sharpening in Spatial Domain.', 'FontSize', 18, 'FontWeight', 'bold');
