%% Exercise 4.2

%% two coubes defined by:
interval = [-5 5 -10 10];
f1 = @(x1,x2) (-x1^2 - 4 * x2^2 + 20);
f2 = @(x1,x2) (x1^4 - x2 - 10);

%% Plot courves
fig = figure; hold on; grid on ;
f1data = ezplot(f1, interval, fig);
set(f1data, 'LineColor', 'red')
set(f1data, 'LineWidth', 2)
f2data = ezplot(f2, interval, fig);
set(f2data, 'LineColor', 'blue')
set(f2data, 'LineWidth', 2)
set(f2data, 'LineWidth', 2)
title('Exercise 4.2')
legend(' 4 * x2^2 = -x1^2 + 20', '10 = x1^4 - x2')