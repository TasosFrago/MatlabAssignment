function findOccurances(str)
% FINDOCCURANCES - 
%   
    res = zeros(1,26);

    for i = 1:strlength(str)
        if(str(i) >= 65 && str(i) <= 90)
            res(str(i) - 64) = res(str(i) - 64) + 1;

        elseif (str(i) >= 97 && str(i) <= 122)
            res(str(i) - 96) = res(str(i) - 96) + 1;

        end
    end

    for i = 1:26
        if(res(i) ~= 0)
            fprintf("Found %c: %d times \n", (i+96), res(i));
        end
    end
end
