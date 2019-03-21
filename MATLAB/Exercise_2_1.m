%% Exercise 2.1
% Authors : 
%   - Lucas Emilio Mendes Ferreira
%   - Pedro Henrique Suruagy Perrusi
% Prof :  Omran Hassan

%% Plot Params
titleSize = 36;
legendSize = 20;
labelSize = 18;
lineWidith = 4;
markerSize = 4*lineWidith;

%% Definition de la fonction 
f2_1 = @(x) x.^4 + 4 *x.^3 + 9*x.^2 + 6*x + 6;

% On cree le vecteur dans [-2 2]
x = -2 : 0.1 : 2;

% on compute et affiche le signal de sortie
y = f2_1(x);
figure
plot(x, y, 'LineWidth', lineWidith);
hold on; grid on;
xlabel('X', 'FontSize', labelSize);
ylabel('Y', 'FontSize', labelSize);
title('Exercise 2.1 f(x)', 'FontSize', titleSize);

%% find local minima
rho = 0.382; % fibbonacci
epsilon = 0.01; % tolerance
max_interactions = 1e5;
[x_min, counter] = golden_section(f2_1, x, rho, epsilon, max_interactions);

%% show results
plot(x_min, f2_1(x_min), '*', 'MarkerSize', markerSize, 'LineWidth', lineWidith);
disp('Local minimum found: ');
disp(x_min)
disp('Number of interactions')
disp(counter)

lgd = legend('f(x) = x^4 + 4 x^3 + 9 x.^2 + 6 x + 6',...
        ['x_{min} = ' num2str(x_min)]);
lgd.FontSize = legendSize;