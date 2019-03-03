%% Exercise 2.2
% Definition de la fonction
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
disp('Newton Method!')
[x_min_newton, counter] = newton_methode(f2_2, df2_2, ddf2_2, xo, epsilon, max_interactions);
plot(x_min_newton, f2_2(x_min_newton), '+');
disp('Local minimum found: ');
disp(x_min_newton)
disp('Number of interactions')
disp(counter)

%% Exercise 2.2b : on compute le minimum a partir de la methode de secant
disp('Secant Method!')
% initial guesses
X0 = 2.1; X1 = 2;
epsilon = 1e-4; % tolerance
max_interactions = 1e5;
% call secant methode
[x_min_secant, counter] = secant_methode(f2_2, df2_2, X0, X1, epsilon, max_interactions);
plot(x_min_secant, f2_2(x_min_secant), '*');
disp('Local minimum found: ');
disp(x_min_secant)
disp('Number of interactions')
disp(counter)

legend('y(x)', ['newton = ', num2str(x_min_newton)], ['secant = ', num2str(x_min_secant)])