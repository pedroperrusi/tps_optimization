%% Exercise 4.2

%% two courbes defined by:
interval = [-10 10 -10 10];
f1 = @(x1,x2) (-x1^2 - 4 * x2^2 + 20);
f2 = @(x1,x2) (x1^4 - x2 - 10);

% subtract the two parametric functions (f2 - f1)
fdiff = @(x1,x2) f1(x1,x2) - f2(x1,x2);

%% Plot courves
fig = figure; hold on; grid on ;
% plot f1
f1data = ezplot(f1, interval, fig);
set(f1data, 'LineColor', 'red')
set(f1data, 'LineWidth', 2)
% plot f2
f2data = ezplot(f2, interval, fig);
set(f2data, 'LineColor', 'blue')
set(f2data, 'LineWidth', 2)
set(f2data, 'LineWidth', 2)
% plot fsub
fdiffdata = ezplot(fdiff, interval, fig);
set(fdiffdata, 'LineColor', 'green')
set(fdiffdata, 'LineWidth', 2)
set(fdiffdata, 'LineWidth', 2)
title('Exercise 4.2')
legend('f1 = 4 * x2^2 = -x1^2 + 20',...
       'f2 = 10 = x1^4 - x2',...
       'fdiff = x1^4 + x1^2 + 4 * x2^2 - x2 - 30')
   
%% Optimization
% we note that the squared norm of the pairs |(x1, x2)| of fdiff est minimale pour les intersections
% so our cost function can be defined as
Fcost = @(x1,x2) sqrt(x1.^2 + x2.^2);
% it will be applied to all x1 and x2 which satisfies fdiff:
x1 = fdiffdata.XData;
x2 = fdiffdata.YData;