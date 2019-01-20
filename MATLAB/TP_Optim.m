%% TP Optimization TPS 2018-19
% Author : Pedro Henrique Suruagy Perrusi
% Prof :  Omran Hassan
%% Initial Setup
clear all;
close all;
%% Exercise 1.4
% We create the surface of interest for the function
x1 = -5 : 0.1 : 5;
x2 = -5 : 0.1 : 5;
[X_1,X_2] = meshgrid(x1,x2);
% the function is applied to the meshgrid
f = (X_2 + X_1 -3).^2 + 2 .* (X_2 - X_1 + 1).^2;
% plot it first as a surface
surf(X_1, X_2, f);
xlabel('X_1')
ylabel('X_2')
zlabel('f(X_1, X_2)');
title('Exercise 1.3')
grid on;
colorbar;
% Then plot it as level sets
figure
contourf(X_1,X_2,f,20);
xlabel('X_1')
ylabel('X_2')
zlabel('f(X_1, X_2)');
title('Exercise 1.3')
grid on;
colorbar;

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
[x_min, counter] = golden_section(f2_1, x, rho, epsilon, max_interactions);
% show results
plot(x_min, f2_1(x_min), '*');
disp('Local minimum found: ');
disp(x_min)
disp('Number of interactions')
disp(counter)

%% Exercise 2.2
% D?finition de la fonction
f2_2 = @(x) 2*x.^4 - 5*x.^3 + 100*x.^2 + 30*x - 75;
% On affiche la r?ponse dans [-2 2];
x = -2 : 0.1 : 2;
y = f2_2(x);
figure
plot(x, y, 'LineWidth', 2);
hold on;
xlabel('X');
ylabel('Y');
title('Exercise 2.2 f(x)');
%% Exercise 2.2a : on compute le minimum a partir de la methode de Newton
% la premiere derivative de f2_2 :
df2_2 = @(x) 8*x.^3 - 15*x.^2 + 200*x + 30;
ddf2_2 = @(x) 24*x.^2 - 30*x + 200;
% parametres d'optimization
xo = 2; % initial point
epsilon = 1e-4; % tolerance
max_interactions = 1e5;
% call newton method
[x_min, counter] = newton_methode(f2_2, df2_2, ddf2_2, xo, epsilon, max_interactions);
plot(x_min, f2_2(x_min), '+');
disp('Local minimum found: ');
disp(x_min)
disp('Number of interactions')
disp(counter)
%% Exercise 2.2b : on compute le minimum a partir de la methode de secant
% initial guesses
X0 = 2.1; X1 = 2;
epsilon = 1e-4; % tolerance
max_interactions = 1e5;
% call secant methode
[x_min, counter] = secant_methode(f2_2, df2_2, X0, X1, epsilon, max_interactions);
plot(x_min, f2_2(x_min), '*');
disp('Local minimum found: ');
disp(x_min)
disp('Number of interactions')
disp(counter)