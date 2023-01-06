function approximate(l)
% APPROXIMATE - 
%   

    % approximation = 1;
    % fact = 0;
    % for n = 1:l
    %     fact = factorial(n);
    %     approximation = approximation + 1/fact;
    % end
    % fprintf("%0.10f\n", approximation);
    % fprintf("%0.10f\n", exp(1));

    e = round(exp(1), l);
    fprintf("%.11f \n", e);

end
