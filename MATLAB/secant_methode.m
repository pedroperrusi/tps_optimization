function [ Xmin, counter ] = secant_methode( func, dfunc, X0, X1, epsilon, max_counter )
%SECANT_METHODE Summary of this function goes here
%   Detailed explanation goes here
counter = 0;
diff = abs(X0 - X1);

while(diff > epsilon && counter < max_counter)
   % on estime un troisieme point
   X2 = X1 - dfunc(X1)*diff / (dfunc(X0)-dfunc(X1));
   diff = abs(X2 - X1);
   X1 = X2;
   X0 = X1;
   counter = counter + 1;
end
Xmin = mean([X1 X2]);
end

