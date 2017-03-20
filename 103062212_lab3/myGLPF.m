function output = myGLPF(D0,M,N);
    %use a b matrix to get D matrix more easily
    [a b] = meshgrid(1:N,1:M);
    %calculate D matrix          the distance to center's square
    D = (a - (N/2)) .^2 + (b - (M/2)) .^2;
    %follow the equation 4.8-7
    output = exp(-D / 2 / (D0.^2));
end