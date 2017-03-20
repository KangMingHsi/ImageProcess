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
fprintf('Do FFT\n');

% [m n] = size(input_s);
% 
% input_tmp = zeros(2 * m, 2 * n);
% input_tmp(1:m, 1:n) = input_s;
% 
% 
% [y x] = meshgrid(1:2*n, 1:2*m);
% 
% input_tmp = input_tmp .* ((-1) .^ (x + y));
% 
% input_f = fft2(input_tmp);

[m n] = size(input_s);

input_tmp = zeros( m,  n);
input_tmp(1:m, 1:n) = input_s;


[y x] = meshgrid(1:n, 1:m);

input_tmp = input_tmp .* ((-1) .^ (x + y));

input_f = fft2(input_tmp);

imshow(abs(input_f), [0 300]);
pause;
%--------------------------------------------------------------
fprintf('addMotionBlur\n');

[output_f, H] = addMotionBlur(input_f, 1, 0.1,0.1);

imshow(output_f);
pause;

output_s = real(ifft2(output_f)) .* ((-1) .^ (x + y)) ;
output_s = output_s(1:m, 1:n);
imshow(output_s);
pause;

%----------------------------------------------------------------
fprintf('addNoise\n');

input_s_noise = addSinNoise(output_s, 0.3, 100, 100);

imshow(input_s_noise);
pause;

%--------------------------------------------------------------
fprintf('Do FFT\n');

% [m n] = size(input_s_noise);
% 
% input_tmp = zeros(2 * m, 2 * n);
% input_tmp(1:m, 1:n) = input_s_noise;
% 
% 
% [y x] = meshgrid(1:2*n, 1:2*m);
% 
% input_tmp = input_tmp .* ((-1) .^ (x + y));
[m n] = size(input_s_noise);

input_tmp = zeros( m, n);
input_tmp(1:m, 1:n) = input_s_noise;


[y x] = meshgrid(1:n, 1:m);

input_tmp = input_tmp .* ((-1) .^ (x + y));

input_f = fft2(input_tmp);

imshow(real(ifft2(input_f)) .* ((-1) .^ (x + y)));
pause;
%--------------------------------------------------------------
fprintf('wienerFiltering\n');

output_f_1 = wienerFiltering(input_f, H, 0.001);

output_s_1 = real(ifft2(output_f_1)) .* ((-1) .^ (x + y));
output_s_1 = output_s_1(1:m, 1:n);
imshow(output_s_1);
computePSNR(input_s,output_s_1)
pause;

output_f_2 = wienerFiltering(input_f, H, 0.005);

output_s_2 = real(ifft2(output_f_2)) .* ((-1) .^ (x + y));
output_s_2 = output_s_2(1:m, 1:n);
imshow(output_s_2);

computePSNR(input_s,output_s_2)

pause;

output_f_3 = wienerFiltering(input_f, H, 0.01);

output_s_3 = real(ifft2(output_f_3)) .* ((-1) .^ (x + y));
output_s_3 = output_s_3(1:m, 1:n);
imshow(output_s_3);
computePSNR(input_s,output_s_3)