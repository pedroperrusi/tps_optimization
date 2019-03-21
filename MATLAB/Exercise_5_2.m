%% Exercise 5.2
% Authors : 
%   - Lucas Emilio Mendes Ferreira
%   - Pedro Henrique Suruagy Perrusi
% Prof :  Omran Hassan

%% Modelage
% Le probleme formalise d'optimisation a la fome suivante

%    B  C   W  AUX
A = [1  1   1   0;...
     10 30  30  0;...
     0  1   0   1;
     0  0   0   1];
 
% les constraintes
b = [120 2500 30 0]'; %[terrain temps terrain/4 aux]

% le cost
c = [-474 -774 -645 0]';

%% Solution
% Solve le probleme d'opmisiation
[x, cost] = linprog(c, [], [], A, b)