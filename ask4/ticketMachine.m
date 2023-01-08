function ticketMachine()
% TICKETMACHINE - 
%   

    while(1)
        fprintf("(0): Standar  1.40€.\n");
        fprintf("(1): Discount 0.60€.\n");
        fprintf("(2): Daily    4.50€.\n");
        fprintf("(3): Weekly   9.00€.\n");
        prompt = 'Choose your ticket from the list.(0 - 3): ';
        usrinput = input(prompt);
        if(usrinput >= 0 && usrinput <= 3)
            break
        else
            fprintf("Wrong option. Please choose one of this options:\n");
        end
    end

    switch usrinput
      case 0
        
    end

end
