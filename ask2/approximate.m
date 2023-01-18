function approximate(l)
% APPROXIMATE - 
%   

    eM = exp(1);
    e = 0;
    n = 136;
    tol = 10^-(l+1)

    while(abs(eM - e) > tol)
        e = (1 + 1/n )^n;
        n = n + 1;
    end

    format long;
    eM
    e
    n
end
