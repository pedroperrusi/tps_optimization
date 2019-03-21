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
plot(t, y, '*', 'LineWidth', lineWidith, 'MarkerSize', markerSize);
plot(t, x_min(1) + t*x_min(2), '--', 'LineWidth', lineWidith);
xlabel('t', 'FontSize', labelSize)
ylabel('y', 'FontSize', labelSize)
title('Exercise 4.3', 'FontSize', titleSize)
lgd = legend('raw data', [ 'linear fit: ' num2str(x_min(1)) ' + ' num2str(x_min(2)) '* t']);
lgd.FontSize = legendSize;