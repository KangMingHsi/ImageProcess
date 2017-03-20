function output = logTransform(input)
   
    %trans from uint to double because of log operator
    output = double(input) + 1;
    %choose a constant to map to [0,1]
    c = 1 / 8;
    %log transform and we will cast back to uint, so multiply 255
    output = c * log(output);
    
end