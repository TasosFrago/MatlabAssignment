function [res, i] = newtonRaphson(f, df, x0, n, tol)
% NEWTONRAPHSON - Finds the roots of a system of non-linear equations using the Newton-Raphson method
% Inputs:
% f	- function handle representing the system of non-linear equations
% df	- function handle representing the Jacobian matrix of f
% x0	- initial guess for the solution
% n	- maximum number of iterations to perform
% tol	- tolerance for the stopping criteria
%
% Outputs:
% res	- estimated solution to the system of non-linear equations
% i	- number of iterations performed

    % Initialize result
    res = [0 0];

    % Perform Newton-Raphson iteration
    for i = 1:n
        % Compute the inverse Jacobian and the residual of the system
        % invJ = inv(df(x0));
        invJ = inverse(df(x0));
        F = f(x0);
        res = x0 - (invJ*F)';

        % Check if the solution has converged
        if(abs(res - x0) < tol)
            break; % Solution has converged
        end

        % Update the guess for the next iteration
        x0 = res;
    end
    % Check if the Newton-Raphson method failed to converge
    if(i == n)
        fprintf("Newton-Raphson method failed to converge.\n");
    end
end

function [B] = inverse(A)
% INVERSE - Find the inverse of a 2x2 matrix
% A: 2x2 matrix to find the inverse of
% B: Inverse of A

    detA = A(1, 1)*A(2, 2) - A(1, 2)*A(2, 1);	% Find the determinant of A
    adjA = [A(2, 2) -A(1, 2); -A(2, 1) A(1, 1)];% Find the adjugate of A
    B = (1/detA) * adjA;			% Divide the adjugate of A by its determinant to get the inverse of A
end
