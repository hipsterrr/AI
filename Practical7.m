% Write and execute the MATLAB Code to learn the LZW image 
% compression technique. 
      
% (i)   Convert the given image to grey level image and visualize the 
% obtained image.

% % I = [39 39 126 126; 39 39 126 126; 39 39 126 126; 39 39 126 126];
% % I = uint8(I);
% % Igrey = I;

Icolor = imread('Lenna.tif');
I = rgb2gray(Icolor);
Igrey = I;


SZIgrey = size(Igrey);
Rowpixels = SZIgrey(1);
Columnpixels = SZIgrey(2);
Igrey = Igrey';
IIgrey = Igrey(:);
IIgrey = IIgrey';
str = IIgrey;

% figure(1), imshow(Igrey)


% (ii)	Apply the LZW compression algorithm for the grey level image.

CompStartTime = tic; 

[EncodedData, CodeCount, table]=lzwCompression(uint8(str));

CompEndTime = toc(CompStartTime);

EncodedOutput = EncodedData-1;

% (iii)	Evaluate the compression time, bits per pixel, and compression ratio.

CompressionTime = CompEndTime;
DictLocation = table.nextCode;
FinalDictLocation = DictLocation - 1;
bits = ceil(log2(FinalDictLocation+1));
avglen = (CodeCount*bits)/(Rowpixels*Columnpixels);

BitsPerPixel = avglen;
CompressionRatio = (Rowpixels*Columnpixels*8)/(Rowpixels*Columnpixels*avglen);
fprintf('\n The Compression Time is %0.4f', CompressionTime);
fprintf('\n The Bits Per Pixel is %0.4f', BitsPerPixel);
fprintf('\n The Compression Ratio is %0.4f', CompressionRatio);

% (iv)	Decompress the encoded data and reconstruct the image. 
    
DeCompStartTime = tic; 

[DecodedData,table]=lzwDecompression(EncodedData);

DeCompEndTime = toc(DeCompStartTime);

IRgrey = reshape(DecodedData,Rowpixels,[]);

IRgrey = IRgrey';
isequal(I,IRgrey);
if ans == 1
fprintf('\n Both the Original and Reconstructed Images are SAME');
end

% % transfor it back to char array
% unpacked = char(unpacked);
% % test
% isOK = strcmp(str,unpacked)
% % show new table elements
Z=table.codes(257:end);
% Y=char(Z);
% char(table.codes{257:end})   
% (v)	Evaluate the decompression time and reconstructed image quality through PSNR.

DeCompressionTime = DeCompEndTime;
[peaksnr, snr] = psnr(uint8(IRgrey), I);
fprintf('\n The Decompression Time is %0.4f', DeCompressionTime);
fprintf('\n The Peak-SNR value is %0.4f', peaksnr);
fprintf('\n The SNR value is %0.4f \n', snr);

% (vi)	Plot the results obtained (Original grey level image and reconstructed image with the display of compression time, bits per pixel, compression ratio, decompression time, and PSNR).
%
figure;
subplot(2,4,1);
imshow(I);
title('Original GL Image');
subplot(2,4,5);
imshow(uint8(IRgrey));
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
text(0,0.6,str);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  