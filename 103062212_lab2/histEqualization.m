function [output, T] = histEqualization(input)
    %get input size 
    [m, n, k] = size(input);
    
    %initial output size
    output = zeros(m,n,k);
    
    %fix rgb problem
    for a = 1:k
        %get histogram of input
        histVector = imageHist(input(:,:,a));
        %caculate PDF of input;
        p_r = histVector / m / n;
    
        %get element number of histVector
        l = length(p_r);
        %initial s
        s = zeros(l,1);
        
        %initial T size
        if a == 1
            T = zeros(l,k);
        end
        
        %do discrete histogram equalization
        for i = 1:l
            if i > 1
                s(i) = s(i-1) + 255 * p_r(i);
            else
                s(1) = 255 * p_r(1);
            end
        end

        %map to the nearest integer
        t_tmp = round(s);

        %transfer input by this table;
        output(:,:,a) = t_tmp(input(:,:,a)+1);
        
        %put histogram to T
        T(:,a) = round(s);
        
        
    end
        %cast back to uint8
        output = cast(output, 'uint8');
end