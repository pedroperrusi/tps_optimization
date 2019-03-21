function [x_min, counter] = gauss_newton_4_2(f1, f2, xo, epsilon, max_interactions)
    %% Function of Gauss Newton Minimization of Exercise 4.2.
    % Needs to recieve the parametric courves and the initial point.
    % The jacobian, however, is hard coded
    counter = 0;
    diff = 1e5; % arbitrary big value (may change depending on the functions)
    
    x_old = xo;

    % loop over each pair of x1, x2
    while (diff > epsilon && counter < max_interactions)

        % Assemble the jacobian matrix for a 2D function
        J= [ 2 * x_old(1)             8 * x_old(2);...
            -4 * x_old(1)^3             1          ];

        f=[ f1(x_old(1), x_old(2));...
            f2(x_old(1), x_old(2))];

        % estimate a x_new
        x_new = x_old - inv(J'*J) * J' * f;

        diff = sum(abs(x_old - x_new));

        counter = counter + 1;
        x_old = x_new;
    end
    
    x_min = x_new;
end