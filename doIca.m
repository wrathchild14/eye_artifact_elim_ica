function [sig, freq, tm, icasig, A, W, W1] = doIca(dataPath)
    [sig, freq, tm] = rdsamp(dataPath, 1:64);
    [icasig, A, W] = fastica(sig.');
    W1 = pinv(W);
end
