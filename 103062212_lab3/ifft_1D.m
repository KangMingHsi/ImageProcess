function output = ifft_1D(input)
    %get size
    [m, n] = size(input);
    %initial size
    output = zeros(m,n);
    
    %do recursive 
    %one element => return
    if(n == 1)
        output = input(:,n);
    %divide elements to two parts by even index and odd index (assume index start from 0)
    %and recursive two array
    else
        %divide
        f_even = input(:,1:2:n);
        f_odd = input(:,2:2:n);
        %recursive
        f_even_out = ifft_1D(f_even);
        f_odd_out = ifft_1D(f_odd);
        %the angle per element
        w = 2 * pi / n;
        %get the half number of total element size
        k = floor(n/2);
        %calculate each element
        for j = 1:k
            complex = cos(w * (j-1)) + i * sin(w * (j-1));
            output(:,j) = (f_even_out(:,j) + f_odd_out(:,j) * complex) / 2;
            output(:,j+k) = (f_even_out(:,j) - f_odd_out(:,j) * complex) / 2;
        end
    end
end