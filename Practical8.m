image = imread("House.tif");
figure;
subplot(2, 3, 1);
imshow(image);
title('Orignal Image');
% (i) Convert the given image to a grayscale image
gray_image = rgb2gray(image);
% the grayscale image
subplot(2, 3, 2);
imshow(gray_image);
title('Grayscale Image');
% Roberts Cross Gradient
roberts_edge = edge(gray_image, 'Roberts'); 
subplot(2, 3, 3);
imshow(roberts_edge);
title('Roberts Edge Detector');
% Sobel
sobel_edge = edge(gray_image, 'Sobel');
subplot(2, 3, 4);
imshow(sobel_edge);
title('Sobel Edge Detector');
% Prewitt
prewitt_edge = edge(gray_image, 'Prewitt');
subplot(2, 3, 5);
imshow(prewitt_edge);
title('Prewitt Edge Detector');
% Canny
canny_edge = edge(gray_image, 'Canny');
subplot(2, 3, 6);
imshow(canny_edge);
title('Canny Edge Detector');
%  the results obtained
sgtitle('Edge Detection using Different Detectors');