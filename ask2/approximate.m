function approximate(l)
% APPROXIMATE - Function to approximate Euler's number (e)
%   This function approximates Euler's number (e) to a certain number of digits (l).
%   The input argument l specifies the desired number of digits of accuracy.
%   The function outputs the Matlab's approximation of e, the approximated value, 
%   the accuracy to the desired number of digits and the number of iterations required.

    eM = exp(1);       % Matlab's approximation of e
    e = 0;             % Approximated value of e
    n = double(2);             % Initialize n
    % n = 136;
    count = 1;         % Counter for number of iterations
    tol = 10^-(l+1);   % Tolerance for the approximation

    % While loop to calculate e
    while(abs(eM - e) > tol)
        e = (1 + 1/n)^n;     % Approximate e using formula
        n = n * 2;           % Double the value of n in each iteration
        % n = n + 1;
        count = count + 1;   % Increment the iteration count
        if(count == 54)
            break
        end
    end

    disp(n);
    disp(1/n)
    disp(vpa(1 + 1/n))
    % Output the results
    fprintf("Matlab's number: \t%.*f\n", (l + 3), eM);
    fprintf("Approximated number: \t%.*f\n", (l + 3), e);
    fprintf("Accuracy to point: \t%s^\n", blanks(l + 1));
    % fprintf("Number of iterations: \t%d\n", (n - 136));
    fprintf("Number of iterations: \t%d\n", count);
end
