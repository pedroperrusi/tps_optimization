%% TP Optimization TPS 2018-19
% Author : Pedro Henrique Suruagy Perrusi
% Prof :  Omran Hassan
%% Initial Setup
clear all;
close all;
%% Exercise 2.1
% Definition de la fonction 
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
[x_min, counter] = golden_section(f2_1, x, rho, epsilon, max_interactions);
% show results
plot(x_min, f2_1(x_min), '*');
disp('Local minimum found: ');
disp(x_min)
disp('Number of interactions')
disp(counter)