function approximate(l)
% APPROXIMATE - 
%   

    eM = exp(1);
    e = 0;
    n = 2;
    %n = 136;
    count = 1;
    tol = 10^-(l+1);

    while(abs(eM - e) > tol)
        e = (1 + 1/n)^n;
        n = n * 2;
        % n = n + 1;
        count = count + 1;
    end

    fprintf("Matlab's number: \t%.*f\n", (l + 3), eM);
    fprintf("Approximated number: \t%.*f\n", (l + 3), e);
    fprintf("Accuracy to point: \t%s^\n", blanks(l + 1));
    % fprintf("Number of iterations: \t%d\n", (n - 136));
    fprintf("Number of iterations: \t%d\n", count);
end
