function ticketMachine()
% TICKETMACHINE - 
%   

    % List of ticket prices
    tickets = [1.40 0.6 4.5 9];
    % List of accepted coins
    money = [10 5 2 1 0.5 0.2 0.1 0.05];

    % Get user's choice of ticket
    while(1)
        fprintf("(1): Standar  1.40€.\n");
        fprintf("(2): Discount 0.60€.\n");
        fprintf("(3): Daily    4.50€.\n");
        fprintf("(4): Weekly   9.00€.\n");

        ticketChoice = str2double(input('Choose your ticket from the list.(1 - 4): ', 's'));

        if(ticketChoice >= 1 & ticketChoice <= 4)
            break;
        else
            fprintf("\nWrong option. Please choose one of this options:\n");
        end
    end
    % Get user's number of tickets
    while(1)
        numberOfTickets = str2double(input('How many tickets do you want? ', 's'));

        if(numberOfTickets > 0)
            break
        else
            fprintf("\nNot a valid number of tickets. Please put a valid number.\n");
        end
    end

    % Find price user has to pay
    finalPrice = tickets(ticketChoice);
    priceDifference = finalPrice * numberOfTickets;

    while(1)
        % disp(priceDifference);
        fprintf("You owe %.2f€. You can insert:\n", priceDifference);
        fprintf("\t(1): 10 euro note\n");
        fprintf("\t(2): 5 euro note\n");
        fprintf("\t(3): 2 euro coin\n");
        fprintf("\t(4): 1 euro coin\n");
        fprintf("\t(5): 50 cent euro coin\n");
        fprintf("\t(6): 20 cent euro coin\n");
        fprintf("\t(7): 10 cent euro coin\n");
        fprintf("\t(8): 5 cent euro coin\n");
        
        moneyInserted = str2double(input('Choose money to insert.(1 - 8): ', 's'));

        if(moneyInserted >= 1 & moneyInserted <= 8)
            priceDifference = round(priceDifference - money(moneyInserted), 2);

            % Round to 2 decimals to get 0
            if(~priceDifference)
                break;
            elseif(priceDifference < 0)
                fprintf("You inserted more money. Here's the difference:\n");
                priceDifference = - priceDifference;

                for i = 1:length(money)

                    if(money(i) == priceDifference)
                        fprintf("\tYou got %.2f€.\n", money(i));
                        priceDifference = round(priceDifference - money(i), 2);
                        break;
                    elseif(priceDifference > money(i))
                        fprintf("\tYou got %.2f€.\n", money(i));
                        priceDifference = round(priceDifference - money(i), 2);
                    end
                end
                break;
            end
        else
            fprintf("\nWrong option. Please choose one of this options:\n");
        end
    end
    fprintf("Payment complete\n");

end
