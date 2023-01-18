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

    n = ceil(l / log10(2));

    eM = exp(1);

    e = (1 + 1/n)^n
    
    dif = eM - e;

    fprintf("%.11f \n", eM);
    fprintf("%.11f \n", e);
    fprintf("%.11f \n", dif);

end
