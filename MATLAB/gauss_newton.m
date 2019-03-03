function [ x_min, counter ] = gauss_newton( func, Jfunc, xo, epsilon, max_counter )
% GAUSS_NEWTON Summary of this function goes here
%   Detailed explanation goes here
counter = 0;
diff = 1e5; % arbitrary big value (may change depending on the functions)

x_old = xo;
while (diff > epsilon && counter < max_counter)
    % on compute le noveau valeur pour x
    x_new = x_old - inv(Jfunc(x_old)'*Jfunc(x_old)) * Jfunc(x_old)' * func(x_old) ;
    
    diff = sum(abs(x_old - x_new));
    
    counter = counter + 1;
    x_old = x_new;
end
x_min = mean([x_new x_old]);
end


