function fasterApproximation(l)
% FASTERAPPROXIMATION - Function to approximate Euler's number (e)
%   This function approximates Euler's number (e) to a certain number of digits (l).
%   The input argument l specifies the desired number of digits of accuracy.
%   The function outputs the Matlab's approximation of e, the approximated value, 
%   the accuracy to the desired number of digits and the number of iterations required.

    eM = exp(1);       % Matlab's approximation of e
    e = 0;             % Approximated value of e
    n = 0;             % Initialize n
    tol = 10^-(l+1);   % Tolerance for the approximation

    % While loop to calculate e
    while(abs(eM - e) > tol)
        e = e + 1/factorial(n);
        n = n + 1;
    end

    % Output the results
    fprintf("Matlab's number: \t%.*f\n", (l + 3), eM);
    fprintf("Approximated number: \t%.*f\n", (l + 3), e);
    fprintf("Accuracy to point: \t%s^\n", blanks(l + 1));
    fprintf("Number of iterations: \t%d\n", (n + 1));

end

function [res] = factorial(n)
% FACTORIAL - Function to return the factorial of n
    res = 1;
    for i = 1:n
        res = i * res;
    end
end
