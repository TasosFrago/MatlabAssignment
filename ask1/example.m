% Example input
x = [0 4 6.5];
y = [1.42 6.18 4.75];

% Using timeit function to messure the time required to run drawCircles
f = @() drawCircles(x, y);
time = timeit(f);

% Print the time
fprintf("The function took %fs to run.\n", time);
