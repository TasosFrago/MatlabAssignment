clc
clear

f = @(x, y) 1 - x - y*sin(pi*x/2);
g = @(x, y) exp(-y) + 10*cos(pi*x) - 2;

hold on
ez1 = ezplot(f);
ez2 = ezplot(g);
set(ez1, 'Color', 'green');
set(ez2, 'Color', 'red');
title('f(x,y) - g(x,y) plot')
grid on;
line([0,0], ylim, 'Color', 'k', 'LineWidth', 0.5); % Draw line for Y axis.
line(xlim, [0,0], 'Color', 'k', 'LineWidth', 0.5); % Draw line for X axis.

plot(-1, 0, 'b*');
text(-1, 0, ['(-1, 0)'],'VerticalAlignment','top','HorizontalAlignment','left')

plot(0.1, 0.1, 'b*');
text(0.1, 0.1, ['(0.1, 0.1)'],'VerticalAlignment','top','HorizontalAlignment','left')

plot(1, 0, 'b*');
text(1, 0, ['(1, 0)'],'VerticalAlignment','top','HorizontalAlignment','left')


% plot(1.499, -0.705, 'r*');
% text(1.499, -0.705, ['(1.499, -0.705)'],'VerticalAlignment','top','HorizontalAlignment','left')

% plot(14.435, 21.244, 'r*');
% text(14.435, 21.244, ['(14.435, 21.244)'],'VerticalAlignment','top','HorizontalAlignment','left')
hold off
