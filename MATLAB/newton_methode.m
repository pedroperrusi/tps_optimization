function [ x_min, counter ] = newton_methode( func, dfunc, ddfunc, xo, epsilon, max_counter )
%NEWTON_METHODE Summary of this function goes here
%   Detailed explanation goes here
counter = 0;
diff = 1e5; % arbitrary big value (may change depending on the functions)

x_old = xo;
while (diff > epsilon && counter < max_counter)
    % on compute le noveau valeur pour x
    x_new = x_old - dfunc(x_old)/ddfunc(x_old);
    
    diff = abs(x_old - x_new);
    
    counter = counter +1;
    x_old = x_new;
end
x_min = mean([x_new x_old]);
end

