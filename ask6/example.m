% Example Base
R3 = [3 -1 2; 0 0 9; 4 7 11];	

% Using timeit function to messure the time required to run drawCircles
f = @() gramSchmidt(R3);
time = timeit(f);

% Print the time
fprintf("The function took %fs to run.\n\n", time);

% Print the output of function
fprintf("Ouput for base R3\n");
disp(gramSchmidt(R3));
