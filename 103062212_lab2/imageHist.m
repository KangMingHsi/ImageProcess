function histVector = imageHist(input)

    %get input size
    [m, n] = size(input);
    %initial histVector
    histVector = zeros(256,1);
    
    %go over each element and record how many times each intensity appear
    for i = 1:m
        for j = 1:n
            histVector(input(i,j) + 1, 1) = histVector(input(i,j) + 1, 1) + 1;
        end
    end
end