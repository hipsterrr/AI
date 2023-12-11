% Butterworth Filters - low and high

% Load Lenna.tif
original_image = imread('Lenna.tif');

% Convert the image to grayscale
gray_image = rgb2gray(original_image);

% Define different cutoff frequencies and filter orders
cutoffFrequencies = [10, 20, 30, 40, 50];
filterOrders = [10, 20, 30, 40, 50];

% Create a new figure to display all the filtered images
figure;

for i = 1:numel(cutoffFrequencies)
    for j = 1:numel(filterOrders)
        cutoff = cutoffFrequencies(i);
        n = filterOrders(j);
        
        % Create the Butterworth high-pass filter in the frequency domain
        [rows, cols] = size(gray_image);
        [X, Y] = meshgrid(1:cols, 1:rows);
        centerX = ceil(cols/2);
        centerY = ceil(rows/2);
        D = sqrt((X - centerX).^2 + (Y - centerY).^2);
        H = 1 - 1 ./ (1 + (D ./ cutoff).^(2 * n));
        
        % Apply the filter to the grayscale image in the frequency domain
        F = fft2(double(gray_image));
        F_sharp = F .* H;
        sharpenedImage = real(ifft2(F_sharp));
        
        % Create a subplot for each filtered image
        subplot(numel(cutoffFrequencies), numel(filterOrders), (i - 1) * numel(filterOrders) + j);
        imshow(sharpenedImage, []);
        title(['Cutoff: ' num2str(cutoff) ', Order: ' num2str(n)]);
    end
end

% Adjust the figure layout
sgtitle('Butterworth High-Pass Filters with Different Orders and Cutoff Frequencies');

% Define different cutoff frequencies and filter orders
cutoffFrequencies = [10, 20, 30, 40, 50];
filterOrders = [1, 2, 3, 4, 5];

% Create a new figure to display all the filtered images
figure;

for i = 1:numel(cutoffFrequencies)
    for j = 1:numel(filterOrders)
        cutoff = cutoffFrequencies(i);
        n = filterOrders(j);
        
        % Create the Butterworth low-pass filter in the frequency domain
        [rows, cols] = size(gray_image);
        [X, Y] = meshgrid(1:cols, 1:rows);
        centerX = ceil(cols/2);
        centerY = ceil(rows/2);
        D = sqrt((X - centerX).^2 + (Y - centerY).^2);
        H = 1 ./ (1 + (cutoff ./ D).^(2 * n));
        
        % Apply the filter to the grayscale image in the frequency domain
        F = fft2(double(gray_image));
        F_smooth = F .* H;
        smoothedImage = real(ifft2(F_smooth));
        
        % Create a subplot for each filtered image
        subplot(numel(cutoffFrequencies), numel(filterOrders), (i - 1) * numel(filterOrders) + j);
        imshow(smoothedImage, []);
        title(['Cutoff: ' num2str(cutoff) ', Order: ' num2str(n)]);
    end
end

% Adjust the figure layout
sgtitle('Butterworth Low-Pass Filters with Different Orders and Cutoff Frequencies');
