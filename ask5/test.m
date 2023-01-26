function test()

    f = @(x) 1/x;
    k = 6;
    tab = zeros(7, k);
    tab(:, 1) = 3.0:0.1:3.6;
    n = 7;

    for i = 1:n
        tab(i, 2) = f(tab(i, 1));
    end
    
    for j = 3:k
        for i = (j-1):n
            tab(i, j) = tab(i, j-1) - tab(i-1, j-1);
        end
    end
    tab
    res = (tab(2, 3) - tab(3, 4)/2 + tab(4, 5)/3 - tab(5, 6)/4)*tab(1, 2);
    res/0.1
end
