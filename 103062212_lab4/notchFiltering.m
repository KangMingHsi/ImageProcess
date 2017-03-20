function [output_f, Notch] =  notchFiltering(input_f, D0, u0, v0)
    %get size
    [m n] = size(input_f);
    %create two matrixes relate to row, col
    [v u] = meshgrid(1:n, 1:m);
    %by equation 
    D1 = sqrt((u - (m/2) - u0) .^2 + (v - (n/2) - v0) .^2);
    D2 = sqrt((u - (m/2) + u0) .^2 + (v - (n/2) + v0) .^2);
    
    %if(D1 <= D0) => get 0, else get 1 
    %the same to D2 <= D0
    %so we can do .* to get (and &&) use complement
    Notch = ((D1 > D0) .* (D2 > D0));
    
    %mul to get output
    output_f = input_f .* Notch ;
end