function [output, scaledUnsharp, blurredInput] = unsharpFiltering(input, boxMask, scale)
    
    %change input to double
    tmp = double(input) / 255;
    
    %blur input
    blurredInput = spatialFiltering(tmp,boxMask);
    
    %get scaledUnsharp
    scaledUnsharp = scale * (tmp - blurredInput);
    
    %plus scaledUnsharp and input to get output
    output = tmp + scaledUnsharp;
end