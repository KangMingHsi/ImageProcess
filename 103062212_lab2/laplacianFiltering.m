function [output, scaledLaplacian] = laplacianFiltering(input, laplacianMask, scale)
    
    %change input to double
    tmp = double(input) / 255;
    
    %use the mask to multiply and then times scale
    scaledLaplacian = spatialFiltering(tmp, laplacianMask) * scale;
    
    %plus scaledLaplacian and input to get output
    output = scaledLaplacian + tmp;

end