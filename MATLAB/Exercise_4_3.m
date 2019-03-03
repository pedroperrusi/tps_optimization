%% Exercise 4.4
% Author : Pedro Henrique Suruagy Perrusi
% Prof :  Omran Hassan
%% load the data
load('data/P4_3.mat')
%% Objective
% Faire l'optilisation de moindres carres des donnes
% soit x = [b a]'

%% Least Square fit
A = [ones(size(t)) t]; % simple first order fit
b = y;

% pseudoinverse de A 
A_pseudinverse = inv(A'*A)*A';
x_min = A_pseudinverse * b;

%% plot data
figure;  hold on; grid on ;
plot(t, y, 'LineWidth', 2);
plot(t, x_min(1) + t*x_min(2), 'LineWidth', 2);
xlabel('t')
ylabel('y')
title('Exercise 4.3')
legend('raw data', [num2str(x_min(1)) ' + ' num2str(x_min(2)) '* t'])