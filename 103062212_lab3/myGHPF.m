function output = myGHPF(D0,M,N);
    %use 1 to minus lowpass function then we can get highpass function
    output = 1 - myGLPF(D0,M,N);
end