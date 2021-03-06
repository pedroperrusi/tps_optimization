%% Exercise 4.4
% Authors : 
%   - Lucas Emilio Mendes Ferreira
%   - Pedro Henrique Suruagy Perrusi
% Prof :  Omran Hassan

%% Plot Params
titleSize = 36;
legendSize = 20;
labelSize = 18;
lineWidith = 4;
markerSize = 2*lineWidith;

%% load the data
load('data/P4_4.mat')
%% Objective
% estimer x = [a w phi] d'une sinusoide

%% definition des fonctions
% fonction cout
fc = @(x, y, t) y - x(1) * sin(x(2)*t+x(3));
% jacobian de la fonction cout
Jf_a = @(x, t) - sin(x(2) * t+ x(3));
Jf_w = @(x, t) - t * x(1) * cos(x(2) * t + x(3));
Jf_phi = @(x, t) - x(1) * cos(x(2) * t + x(3));

%% Gauss newton method
counter = 0;
diff = 1e5; % arbitrary big value (may change depending on the functions)

% Initial Conditions
xo = [0.5 1.25 0.1]';
x_old = xo;

% initialize F
F = zeros(length(y), 1); % matrix of dimensions (m, 1)
% initialize J
J = zeros(length(y), length(xo)); % matrix of dimensions (m, 3)

while (diff > epsilon && counter < max_interactions)
    % construct the Function and Jacobian matrix for x_old
    for i = 1 : length(y)
        F(i) = fc(x_old, y(i), t(i));
        J(i, :) = [Jf_a(x_old, t(i)), Jf_w(x_old, t(i)), Jf_phi(x_old, t(i))];
    end
    
    % estimate a x_new
    x_new = x_old - inv(J'*J) * J' * F ;
    
    diff = sum(abs(x_old - x_new));
    
    counter = counter + 1;
    x_old = x_new;
end
x_min = x_new;

%% plot data
figure; hold on; grid on ;
plot(t, y, '*', 'LineWidth', lineWidith, 'MarkerSize', markerSize);
xlabel('t', 'FontSize', labelSize)
ylabel('y', 'FontSize', labelSize)
%% plot results
ye = x_min(1) * sin(t*x_min(2) + x_min(3));
plot(t, ye, '--', 'LineWidth', lineWidith);
title('Exercise 4.4', 'FontSize', titleSize)
lgd = legend('raw data', ['Sinusoidal fit :' num2str(x_min(1)) ' sin(' num2str(x_min(2)) 't + ' num2str(x_min(3)) ')']);
lgd.FontSize = legendSize;