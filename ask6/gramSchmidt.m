function [ U ] = gramSchmidt(V)
    [m, n] = size(V);
    U = zeros(m, n);
    U(:, 1) = V(:, 1);

    for i=1:n-1
        s = 0;
        for k=1:floor(i/2)
            % replace k with i if not correct version
            % s = s + ((sum(V(:, i+1) .* U(:, k))) / (sum(U(:, k).^2))) * U(:, k);
            s = s + proj(V(:, i+1), U(:, k));
            s = s + proj(V(:, i+1), U(:, k+floor(i/2)));
        end
        if(mod(i, 2))
            s = s + proj(V(:, i+1), U(:, i));
        end
        U(:, i+1) = V(:, i+1) - s;
    end
end

function [ res ] = proj(v, u)
    m = size(v, 1);

    vecProd = v.*u;
    vecSq = u.^2;

    dotProduct = 0;
    normSquared = 0;

    % for i = 1:m
    %     dotProduct = dotProduct + vecProd(i);
    %     normSquared = normSquared + vecSq(i);
    % end
    for i = 1:floor(m/2)
        dotProduct = dotProduct + vecProd(i);
        dotProduct = dotProduct + vecProd(i+floor(m/2));
        normSquared = normSquared + vecSq(i);
        normSquared = normSquared + vecSq(i+floor(m/2));
    end
    if(mod(m, 2))
        dotProduct = dotProduct + vecProd(m);
        normSquared = normSquared + vecSq(m);
    end

    res = (dotProduct / normSquared) * u;
end
