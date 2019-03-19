%% Exercise 3.1

%% Definition de la fonction principale
% fonction auxiliaire (exponent)
func_aux = @(x1, x2) (- x1 .* x1 - x2 .* x2);

% fonction a optimiser
func = @(x1, x2) (1 + 2.*x1.*exp(func_aux(x1,x2)));

%% On compute les derivees
d_func_x1 = @(x1, x2) (2 - 4*x1.*x1) * exp(func_aux(x1,x2));
d_func_x2 = @(x1, x2) - 4 .* x1 .* x2 .* exp(func_aux(x1,x2));

%% Steepest descent method
% on peut estimer le prochaine x ? partir de x1, x2 et alpha
find_next_x1 = @(x1, x2, alpha) x1 - 2 .* alpha .* (1 - x1.*x1) .* exp(func_aux(x1,x2));
find_next_x2 = @(x1, x2, alpha) x2 + 4 .* alpha .* x1 .* x2 .* exp(func_aux(x1,x2));

% minimizer func(find_next_x1(x1, x2, alpha), find_next_x2(x1, x2, alpha)) a partir des valeurs
% initielles x1 et x2

%      x1 x2
x_o = [0.5  -0.5];
% x_o = [-0.5  0.5];
% x_o = [1  1];
func_alpha = @(alpha) func(find_next_x1(x_o(1), x_o(2), alpha), find_next_x2(x_o(1), x_o(2), alpha));
alpha_possibles = 0 : 0.001 : 10;

% find local minima de alpha
rho = 0.382; % fibbonacci
epsilon = 0.1; % tolerance
max_interactions = 1e5;
[alpha_min, counter] = golden_section(func_alpha, alpha_possibles, rho, epsilon, max_interactions);

%% Visualiser le probleme de line search ?
figure; hold on; grid on;
plot(alpha_possibles, func_alpha(alpha_possibles))
plot(alpha_min, func_alpha(alpha_min), '*');