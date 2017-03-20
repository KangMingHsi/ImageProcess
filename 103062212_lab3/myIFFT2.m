function output = myIFFT2(input)
    %change data type
    f = im2single(input);
    %get image size
    [m, n, k] = size(f);
    
    %if size isn't the power of 2, then change it to the power of 2
    a = 2^floor(log(m) / log(2));
    b = 2^floor(log(n) / log(2));
    
    %resize to power of 2
    f = imresize(f, [a b]);
    
    %initial output
    output = f;
    
    %for different color domain
    for w = 1:k
        %each row IDFT
        output(:,:,w) = ifft_1D(output(:,:,w)); 
        %each column IDFT
        output(:,:,w) = ifft_1D(output(:,:,w).').'; 
    end
    
    
end