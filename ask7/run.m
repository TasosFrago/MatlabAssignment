clear
clc

f = @(x) [
    1-x(1)-x(2)*sin(pi*x(1)/2);  % f(x, y)
    exp(-x(2))+10*cos(pi*x(1))-2 % g(x, y)
         ];

df = @(x) [
    -1-x(2)*cos(pi*x(1)/2)*(pi/2),   -sin(pi*x(1)/2);
    -10*pi*sin(pi*x(1)),             -exp(-x(2))
          ];

tol = 1e-7;

x0 = [1 0]; n = 18;

% x0 = [-1 0]; n = 15;

% x0 = [-0.1 0]; n = 30;

[res, times] = newtonRaphson(f, df, x0, n, tol);

fres = f(res);
fprintf("For f(x, y) = 0 and g(x, y) = 0 using the method Newton-Raphson that run %d times, we found that\n\tx0 = %.6f,\n\ty0 = %.6f\n", times, res(1), res(2));
fprintf("f(x0, y0) = %.6f\ng(x0, y0) = %.6f\n", fres(1), fres(2));

% x0 = [14 21];
