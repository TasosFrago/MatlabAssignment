function fasterApproximation(l)

    eM = exp(1);
    e = 0;
    tol = 10^-(l + 1);
    n = 0;

    while(abs(eM - e) > tol)
        e = e + 1/factorial(n);
        n = n + 1
    end

    fprintf("Matlab's number: \t%.*f\n", (l + 3), eM);
    fprintf("Approximated number: \t%.*f\n", (l + 3), e);
    fprintf("Accuracy to point: \t%s^\n", blanks(l + 1));
    fprintf("Number of iterations: \t%d\n", (n + 1));

end

function [res] = factorial(n)
    res = 1;
    for i = 1:n
        res = i * res;
    end
end
