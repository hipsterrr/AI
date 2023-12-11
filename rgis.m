% (iii)	Write a function rgis(I,S,T) 

function [IO, NR , SI , TI ] = rgis(I, S, T)
% function [IO, NR , SI , TI ] = rgis(I, S, T) where S can be an array 
% (the same size as I) with a 1 at the coordinates of every seed point 
% and 0s elsewhere. S can also be a single seed value. 
% Similarly T can be an array (the same size as I) containing a threshold 
% value for each pixel in I. T can also be a scalar, in which case 
% it becomes a global threshold. The output of the function rgis(I,S,T) 
% is [IO, NR, SI, TI] where IO is the segmented image, with the members 
% of each region being labeled with an integer value. NR is the number 
% of different regions. SI is an image containing the final seed points, 
% and TI is an image containing the pixels in I that passed the threshold 
% test before they were processed for connectivity. Both SI and TI are 
% of the same size as I. 

I = double(I) ;
% If S is a scalar, obtain the seed image .
if numel(S) == 1 
SI = I == S;
S1 = S; 
else  
% S is an array . Eliminate duplicate, connected seed locations
% to reduce the number of loop executions in the following 
% sections of code.
SI = bwmorph(S, 'shrink', Inf) ; 
S1 = I(SI) ; % Array of seed values. 
end
% figure(1), imshow(SI);

TI = false(size(I));
for K = 1:length(S1)  
seedvalue = S1(K); 
S = abs(I - seedvalue) <= T; % Re-use variable S.
TI = TI | S;
end
% figure(2), imshow(SI);
% figure(3), imshow(TI);

% Use function imreconstruct with SI as the marker image to
% obt ain the regions corresponding to each seed in S. Function
% bwlabel assigns a different integer to each connected region .
[IO, NR ] = bwlabel(imreconstruct(SI, TI));
% figure(4), imshow(IO);
