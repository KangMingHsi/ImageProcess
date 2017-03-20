function output_f = wienerFiltering(input_f, H, K)
    %by equation
    output_f = (1 * (H .^(-1))) .* (abs(H) .^ 2) .* (((abs(H) .^ 2) + K) .^ (-1)) .* input_f;

end