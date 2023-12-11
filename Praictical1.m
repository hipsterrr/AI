original_image = imread('Lenna.tif'); % Load your image
og_image_bit = 8;

R_plane = original_image(:, :, 1);
G_plane = original_image(:, :, 2);
B_plane = original_image(:, :, 3);

bit_depths = [7,6,5,4,3,2,1]; % Define the desired bit depths

quantized_color_images = cell(length(bit_depths), 3); % 3 for R, G, and B planes

figure;
% Quantize and plot the R plane
subplot(4, 8, 1); imshow(R_plane); title('Original R')
for i = 1:length(bit_depths)
    quantized_R = (:, :, 1)(floor(double(R_plane) / 2^(og_image_bit - bit_depths(i))) * 2^(og_image_bit - bit_depths(i)));
    subplot(4, 8, i + 1); imshow(quantized_R); title([num2str(bit_depths(i)), '-bit R']);
end

% Quantize and plot the G plane
subplot(4, 8, 9); imshow(G_plane); title('Original G');
for i = 1:length(bit_depths)
    quantized_G = uint8(floor(double(G_plane) / 2^(og_image_bit - bit_depths(i))) * 2^(og_image_bit - bit_depths(i)));
    subplot(4, 8, i + 9); imshow(quantized_G); title([num2str(bit_depths(i)), '-bit G']);
end

% Quantize and plot the B plane
subplot(4, 8, 17); imshow(B_plane); title('Original B');
for i = 1:length(bit_depths)
    quantized_B = uint8(floor(double(B_plane) / 2^(og_image_bit - bit_depths(i))) * 2^(og_image_bit - bit_depths(i)));
    subplot(4, 8, i + 17); imshow(quantized_B); title([num2str(bit_depths(i)), '-bit B']);
end

subplot(4, 8, 25); imshow(original_image); title('Original Image');
for i = 1:length(bit_depths)
    quantized_R = uint8(floor(double(R_plane) / 2^(og_image_bit - bit_depths(i))) * 2^(og_image_bit - bit_depths(i)));
    quantized_G = uint8(floor(double(G_plane) / 2^(og_image_bit - bit_depths(i))) * 2^(og_image_bit - bit_depths(i)));
    quantized_B = uint8(floor(double(B_plane) / 2^(og_image_bit - bit_depths(i))) * 2^(og_image_bit - bit_depths(i)));

    quantized_color_images{i, 1} = quantized_R;
    quantized_color_images{i, 2} = quantized_G;
    quantized_color_images{i, 3} = quantized_B;

    % Combine R, G, and B planes to form a color image
    quantized_color_image = cat(3, quantized_R, quantized_G, quantized_B);
    % Store quantized color image
    quantized_color_images{i} = quantized_color_image;
    subplot(4, 8, i + 25); imshow(quantized_color_image); title([num2str(bit_depths(i)), '-bit B']);
end

bit_depth_quantized_B = log2(double(max(quantized_B(:))) + 1);

sgtitle('LAB 1 - RGB color Image Plane Separation, Conversion of 8-bit Grey Level Image to 7-bit, 6-bit, 5-bit, 4-bit, 3-bit, 2-bit, and 1-bit Images.', 'FontSize', 18, 'FontWeight', 'bold');
