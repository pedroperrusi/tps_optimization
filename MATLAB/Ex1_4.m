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