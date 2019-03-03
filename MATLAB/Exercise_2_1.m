%% Exercise 2.1
% D?finition de la fonction 
f2_1 = @(x) x.^4 + 4 *x.^3 + 9*x.^2 + 6*x + 6;
% On cree le vecteur dans [-2 2]
x = -2 : 0.1 : 2;
% on compute et affiche le signal de sortie
y = f2_1(x);
figure
plot(x, y, 'LineWidth', 2);
hold on;
xlabel('X');
ylabel('Y');
title('Exercise 2.1 f(x)');
% find local minima
rho = 0.382; % fibbonacci
epsilon = 0.01; % tolerance
max_interactions = 1e5;
[x_min_newton, counter] = golden_section(f2_1, x, rho, epsilon, max_interactions);
% show results
plot(x_min_newton, f2_1(x_min_newton), '*');
disp('Local minimum found: ');
disp(x_min_newton)
disp('Number of interactions')
disp(counter)