function [ U ] = gramSchmidt(V)
% GRAMSCHMIDT - This function computes the orthonormal basis of a set of vectors 'V' 
% using the Gram-Schmidt process.
% Input:
%   V -> m x n matrix, where each column is a vector in R^m
%
% Output:
%   U -> m x n matrix, where each column is an orthonormal vector in R^m
%====================================================================================

    [m, n] = size(V);	% Get the dimensions of the input matrix V
    U = zeros(m, n);	% Initialize the output matrix U with zeros
    U(:, 1) = V(:, 1);	% The first column of U is equal to the first column of V
    
    % Loop through the remaining columns of V
    for i=1:n-1
        s = 0; % Initialize the variable 's' to zero

        % Loop through the columns of U that have been computed so far
        for k = 1:i
            % Add the projection of V(:, i+1) onto U(:, k) to 's'
            s = s + proj(V(:, i+1), U(:, k));
        end

        % The next column of U is equal to the next column of V minus the projection
        U(:, i+1) = V(:, i+1) - s;
    end

end

function [ res ] = proj(v, u)
% PROJ - This function calculates the projection of a vector 'v' onto another vector 'u'.
% Input:
%   v -> m x 1 vector in R^m
%   u -> m x 1 vector in R^m
%
% Output:
%   res - m x 1 vector, the projection of 'v' onto 'u'
%======================================================================================

    dotProduct = (v)'*u;	% Calculate the dot product of 'v' and 'u'
    normSquared = (u)'*u;	% Calculate the squared norm of 'u'
    
    % Calculate the projection of 'v' onto 'u'
    res = (dotProduct / normSquared) * u;
end
