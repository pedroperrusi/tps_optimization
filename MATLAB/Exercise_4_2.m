%% Exercise 4.2
% Authors : 
%   - Lucas Emilio Mendes Ferreira
%   - Pedro Henrique Suruagy Perrusi
% Prof :  Omran Hassan

%% Disable ezplot warning
warning('off', 'MATLAB:ezplotfeval:NotVectorized');

%% Plot Params
titleSize = 36;
legendSize = 20;
labelSize = 18;
lineWidith = 4;
markerSize = 4*lineWidith;

%% two courbes defined by:
interval = [-5 5 -10 10];
f1 = @(x1,x2) 4 * x2^2 - 20 + x1^2;
f2 = @(x1,x2) x2 - x1^4 + 10;

% Cost fuunction is the quadratic sum
fcost = @(x1,x2) f1(x1,x2).^2 + f2(x1,x2).^2;

%% Plot courves
fig = figure; hold on; grid on ;
% plot f1
f1data = ezplot(f1, interval, fig);
set(f1data, 'LineColor', 'green')
set(f1data, 'LineWidth', lineWidith)
% plot f2
f2data = ezplot(f2, interval, fig);
set(f2data, 'LineColor', 'blue')
set(f2data, 'LineWidth', lineWidith)
title('Exercise 4.2', 'FontSize', titleSize)
   
%% Optimization Gauss Newton
epsilon = 1e-4; % tolerance
max_interactions = 1e5;

% Initial Conditions
xo_1 = [1 1]';
xo_2 = [-1 1]';
xo_3 = [1 -1]';
xo_4 = [-1 -1]';

for xo = [xo_1 xo_2 xo_3 xo_4]

    % call gauss-newton minimization
    x_min = gauss_newton_4_2(f1, f2, xo, epsilon, max_interactions);

    % plot results
    plot(x_min(1), x_min(2), 'x', 'MarkerSize', markerSize, 'LineWidth', lineWidith)
    
    % show results
    disp(['[4.2] : Local minimum for (', num2str(xo(1)), ', ', num2str(xo(2)), ') = (', num2str(x_min(1)), ', ', num2str(x_min(2)), ')' ])
end

lgd = legend('f1 : 4 * x2^2 = -x1^2 + 20',...
             'f2 : 10 = x1^4 - x2', ...
             'Local Minima for x0 = [1 1]',...
             'Local Minima for x0 = [-1 1]', ...
             'Local Minima for x0 = [1 -1]', ...
             'Local Minima for x0 = [-1 -1]');
lgd.FontSize = legendSize;