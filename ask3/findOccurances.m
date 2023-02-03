function findOccurances(str)
% FINDOCCURANCES - function to find number of occurrences of each letter in a string
% 
% The function takes one input argument `str`, which is the string to be processed.
% The function outputs the number of occurrences of each letter in the string alphabeticly.
%
% Example:
%     findOccurances('Hello world')
%
% Output:
%     Found d: 1 times 
%     Found e: 1 times 
%     Found h: 1 times 
%     Found l: 3 times 
%     Found o: 2 times 
%     Found r: 1 times 
%     Found w: 1 times 
%=============================================================================================

    % Create an array `alphabet` with 26 elements, each representing a letter of the alphabet.
    % The array is initialized to zero.
    alphabet = zeros(1,26);

    % Scan the input string `str`
    for i = 1:strlength(str)

        % If a character in the string is between ASCII values 65 and 90 (upper case letters),
        % its count is increased in the `alphabet` array at the corresponding index (`str(i) - 64`).
        if(str(i) >= 65 && str(i) <= 90)
            alphabet(str(i) - 64) = alphabet(str(i) - 64) + 1;

        % If a character is between ASCII values 97 and 122 (lower case letters),
        % its count is increased in the `alphabet` array at the corresponding index (`str(i) - 96`).
        elseif (str(i) >= 97 && str(i) <= 122)
            alphabet(str(i) - 96) = alphabet(str(i) - 96) + 1;
        end
    end

    % Output the number of occurrences of each letter in the string
    for i = 1:26
        if(alphabet(i) ~= 0)
            fprintf("Found %c: %d times \n", (i+96), alphabet(i));
        end
    end
end
