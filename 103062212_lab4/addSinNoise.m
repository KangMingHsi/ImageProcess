function output_s = addSinNoise(input_s, A, u0, v0)
    %get size
    [M N] = size(input_s);
    
    %create two matrix relate to row, col
    [Y X] = meshgrid(1:N, 1:M);
    
    %by equation
    noise = A * sin(2 * pi * (u0 * X / M + v0 * Y / N) );
    
    %add noise
    output_s = input_s + noise;
end