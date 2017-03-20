clear;
clc;
fprintf('Start pipeline\n');

pause;
%----------------------------------------------------------------

fprintf('LoadData\n');
input_s = im2single(imread('Fig0526(a)(original_DIP).tif'));
imshow(input_s);
pause;
%--------------------------------------------------------------
fprintf('addSinNoise\n');
output_s = addSinNoise(input_s, 1, 0, 1);

imshow(output_s);
pause;
%--------------------------------------------------------------
fprintf('Do FFT\n');

[m n] = size(input_s);

input_tmp = zeros(2 * m, 2 * n);
input_tmp(1:m, 1:n) = output_s;


[y x] = meshgrid(1:2*n, 1:2*m);

input_tmp = input_tmp .* ((-1) .^ (x + y));


input_f = fft2(input_tmp);

imshow(abs(input_f), [0 300]);
pause;
%------------------------------------------------------------
fprintf('notchfiltering\n');

[output_f notch] = notchFiltering(input_f, 50, 0, 200);

imshow(notch);
pause;

imshow(abs(output_f), [0 400]);
pause;

output_tmp = real(ifft2(output_f)) .* ((-1) .^ (x + y));
output_tmp = output_tmp(1:m, 1:n);
imshow(output_tmp);
%---------------------------------------------------------
fprintf('computePSNR\n');

computePSNR(input_s, output_tmp)
