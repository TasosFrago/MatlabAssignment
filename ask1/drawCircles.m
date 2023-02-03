function drawCircles(x, y)
% DRAWCIRCLES - This function plots three circles that intersect at 3 given points.
%   The input arguments x and y are the x and y-coordinates of the three points respectively.
%   The function first calculates the lengths of the sides of the triangle formed by the three points,
%   using the distance formula. The radii of the three circles are then calculated using the triangle sides.
%   The function then plots the three sides of the triangle and the three circles using the 'plot' function.
%   The 'axis equal' command ensures that the x and y scales are equal, so that the circles appear circular.
%   The 'hold on' and 'hold off' commands ensure that multiple plots are not overwritten.

    AB = sqrt((x(2) - x(1))^2 + (y(2) - y(1))^2); % Length of side AB
    AC = sqrt((x(3) - x(1))^2 + (y(3) - y(1))^2); % Length of side AC
    BC = sqrt((x(3) - x(2))^2 + (y(3) - y(2))^2); % Length of side BC

    R = [];                   % Initialize array to store radii
    R(1) = ( AB + AC - BC)/2; % Radius of circle centered at first point
    R(2) = ( AB - AC + BC)/2; % Radius of circle centered at second point
    R(3) = (-AB + AC + BC)/2; % Radius of circle centered at third point

    hold on

    plot([x(1) x(2)], [y(1) y(2)], 'b'); % Plot side AB in blue
    plot([x(2) x(3)], [y(2) y(3)], 'b'); % Plot side BC in blue
    plot([x(1) x(3)], [y(1) y(3)], 'b'); % Plot side AC in blue

    circle(x(1), y(1), R(1)); % Plot circle centered at first point
    circle(x(2), y(2), R(2)); % Plot circle centered at second point
    circle(x(3), y(3), R(3)); % Plot circle centered at third point

    axis equal
    hold off
end

function circle(x, y, r)
% CIRCLE - This function plots a circle centered at (x, y) with radius r.
%   The input arguments x, y and r are the x and y-coordinates of the center of the circle and its radius, respectively.
%   The function calculates the x and y-coordinates of 50 points evenly spaced around the circumference of the circle,
%   using the parametric equation of a circle. The function then plots the circle using the 'plot' function.

    th = 0:pi/50:2*pi;         % Theta range for 50 points
    xunit = r * cos(th) + x;   % x-coordinates of 50 points on circle
    yunit = r * sin(th) + y;   % y-coordinates of 50 points on circle
    plot(xunit, yunit);        % Plot the circle
end
