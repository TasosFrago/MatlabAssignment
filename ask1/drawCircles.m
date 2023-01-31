function drawCircles(x, y)
    %DRAWCIRCLES Summary of this function goes here
    %   Detailed explanation goes here

    AB = sqrt((x(2) - x(1))^2 + (y(2) - y(1))^2);
    AC = sqrt((x(3) - x(1))^2 + (y(3) - y(1))^2);
    BC = sqrt((x(3) - x(2))^2 + (y(3) - y(2))^2);

    R = [];
    R(1) = ( AB + AC - BC)/2;
    R(2) = ( AB - AC + BC)/2;
    R(3) = (-AB + AC + BC)/2;

    hold on

    plot([x(1) x(2)], [y(1) y(2)], 'b');
    plot([x(2) x(3)], [y(2) y(3)], 'b');
    plot([x(1) x(3)], [y(1) y(3)], 'b');

    circle(x(1), y(1), R(1));
    circle(x(2), y(2), R(2));
    circle(x(3), y(3), R(3));

    axis equal
    hold off
end

function circle(x, y, r)
% CIRCLE - 
%   
    th = 0:pi/50:2*pi;
    xunit = r * cos(th) + x;
    yunit = r * sin(th) + y;
    plot(xunit, yunit);
end
