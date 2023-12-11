% Write and execute the MATLAB Code to learn the Huffman coding based 
% image compression.

Icolor = imread('Lenna.tif');

% (i)   Convert the given image to grey level image and visualize the 
% obtained image.
Igrey = rgb2gray(Icolor);
SZIgrey = size(Igrey);
Rowpixels = SZIgrey(1);
Columnpixels = SZIgrey(2);

% figure(1), imshow(Igrey);

% (ii)  Generate the histogram of the obtained grey level image.
[counts,bins] = imhist(Igrey); 

% figure(2), imhist(Igrey);

% (iii) Use the histogram data and generate the Huffman code for 
% the grey level image.
greylevels = bins;
probabilities = counts./(Rowpixels*Columnpixels);

% Transpose of greylevels & probabilities
symbols = greylevels.';
p = probabilities.';

% HUFFMAN ENCODING
CompStartTime = tic; 

[dict,avglen] = huffmandict(symbols,p);
IgreyColumnVector = Igrey(:);
code = huffmanenco(IgreyColumnVector,dict);

CompEndTime = toc(CompStartTime);

% (iv)	Evaluate the compression time, bits per pixel, and 
% compression ratio.
CompressionTime = CompEndTime;
BitsPerPixel = avglen;
CompressionRatio = (Rowpixels*Columnpixels*8)/(Rowpixels*Columnpixels*avglen);
fprintf('\n The Compression Time is %0.4f', CompressionTime);
fprintf('\n The Bits Per Pixel is %0.4f', BitsPerPixel);
fprintf('\n The Compression Ratio is %0.4f', CompressionRatio);

% (v)	Decompress the encoded data and reconstruct the image. 
DeCompStartTime = tic; 

sig = huffmandeco(code,dict);

DeCompEndTime = toc(DeCompStartTime);

IIgrey = reshape(sig,Rowpixels,[]);

isequal(Igrey,IIgrey);
if ans == 1
fprintf('\n Both the Original and Reconstructed Images are SAME');
end

% (vi)	Evaluate the decompression time and reconstructed 
% image quality through PSNR.
DeCompressionTime = DeCompEndTime;
[peaksnr, snr] = psnr(uint8(IIgrey), Igrey);
fprintf('\n The Decompression Time is %0.4f', DeCompressionTime);
fprintf('\n The Peak-SNR value is %0.4f', peaksnr);
fprintf('\n The SNR value is %0.4f \n', snr);


% (vii)	Plot the results obtained (Original grey level image and 
% reconstructed image with the display of compression time, 
% bits per pixel, compression ratio, decompression time, and PSNR).
figure;
subplot(2,4,1);
imshow(Igrey);
title('Original GL Image');
subplot(2,4,5);
imshow(uint8(IIgrey));
title('Reconstructed GL Image');
subplot(2,4,2);
axis off;
str = {'Comp.Time is',CompressionTime'};
text(0,0.6,str);
subplot(2,4,3);
axis off;
str = {'BPP', BitsPerPixel};
text(0,0.6,str);
subplot(2,4,4);
axis off;
str = {'CR is', CompressionRatio};
text(0,0.6,str);
subplot(2,4,6);
axis off;
str = {'Decom.Time is', DeCompressionTime};
text(0,0.6,str);
subplot(2,4,7);
axis off;
str = {'PSNR  is', peaksnr};
text(0,0.6,str);
subplot(2,4,8);
axis off;
str = {'The SNR value is', snr};
text(0,0.6,str);