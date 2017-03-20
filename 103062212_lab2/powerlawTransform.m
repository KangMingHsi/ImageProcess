function output = powerlawTransform(input, r)
   
    %uint cannot ^ with noninteger number
    output = double(input);
    
    %map to [0,1]
    c = 1 / (255 .^ r);
    
    %do powerlaw transform
    output = (output .^ r) * c;
    
end