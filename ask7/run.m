clear
clc

% Matix with functions f and g inside
f = @(x) [
    1-x(1)-x(2)*sin(pi*x(1)/2);   % f(x, y) - First equation
    exp(-x(2))+10*cos(pi*x(1))-2  % g(x, y) - Second equation
         ];

% Jacobian matrix of matrix f
df = @(x) [
    -1-x(2)*cos(pi*x(1)/2)*(pi/2),   -sin(pi*x(1)/2);
    -10*pi*sin(pi*x(1)),             -exp(-x(2))
          ];

tol = 1e-7; % Tolerance value for the Newton-Raphson method

% Different initial guess values and number of iterations.
x0 = [-1 0]; n = 16;		% res --> [1.499230 -0.705166]
% x0 = [0.1 0.1]; n = 20;	% res --> [1.499230 -0.705166]
% x0 = [1 0]; n = 18;		% res --> [14.435906 21.244032]

[res, times] = newtonRaphson(f, df, x0, n, tol); % Call to the Newton-Raphson method

ti = @() newtonRaphson(f, df, x0, n, tol);
time = timeit(ti);

fres = f(res); % Evaluate the function at the obtained result

% Display the result and the number of iterations.
fprintf("For f(x, y) = 0 and g(x, y) = 0 using the method Newton-Raphson that run %d times, we found that\n\tx0 = %.6f,\n\ty0 = %.6f\n", times, res(1), res(2));
fprintf("f(x0, y0) = %.6f\ng(x0, y0) = %.6f\n", fres(1), fres(2));

fprintf("The function took %fs to run.\n", time);
