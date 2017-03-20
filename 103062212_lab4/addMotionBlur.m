function [output_f, H] = addMotionBlur(input_f, T, a, b)
    %get the size
    [m,n] = size(input_f);
    %initial size
    H = zeros(m,n);
    %looping to compute all H(u,v)
    for u=-m/2:(m/2-1);
        for v=-n/2:(n/2-1);
            %degradation function
            t = sin(pi*(u*a+v*b))/(pi*(u*a+v*b));
            
            %error handle
            if isnan(t)
                t = 1;
            end
            
            %by equation
            H(u+m/2+1,v+n/2+1) = T*t*exp(-1*1i*pi*(u*a+v*b));
        end
    end
    
    %get output
    output_f = H .* input_f; 
end