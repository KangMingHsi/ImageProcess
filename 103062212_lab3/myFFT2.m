function output = myFFT2(input)
    %change data type
    f = im2single(input);
    %get image size
    [m, n, k] = size(f);
    a = 1;
    b = 1;
    
    %if size isn't the power of 2, then change it to the power of 2
    a = 2^floor(log(m) / log(2));
    b = 2^floor(log(n) / log(2));
    
    %resize to power of 2
    f = imresize(f, [a b]);
    
    %initial output
    output = f;
    
    %for different color domain
    for w = 1:k
        %each row DFT
        output(:,:,w) = fft_1D(output(:,:,w)); 
       
        %each column DFT
        output(:,:,w) = fft_1D(output(:,:,w).').'; 
    end
end