function output = myIDFT2(input)
    %change data type
    f = im2single(input);
    %get image size
    [m, n, k] = size(f);
    %initial output
    output = zeros(m, n);
    %define imaginary number
    i = sqrt(-1);
    % use to compute exp in a matrix size
    [a, b] = meshgrid(0:n-1, 0:m-1);
    
    %do fourier transform
    for w = 1:k
        for u = 1:m
            for v = 1:n
                output(u,v) = sum(sum(f(:,:,w) .* exp((i * 2 * pi * ((u-1) / m)) * b) .* exp((i * 2 * pi * ((v-1) / n)) * a))) / m / n; 
            end
        end
    end
end