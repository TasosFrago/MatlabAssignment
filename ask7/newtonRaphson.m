function [res, n] = newtonRaphson(f, df, x0, n, tol)
    res = [0 0];
    for i = 1:n
        invJ = inv(df(x0));
        F = f(x0);
        res = x0 - (invJ*F)';

        if(abs(res - x0) < tol)
            break
        end
        x0 = res;
    end
    if(i == n)
        fprintf("Newton-Raphson method failed to converge.\n");
    end
end
