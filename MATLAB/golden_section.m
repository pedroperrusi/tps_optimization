function [ Xmin, counter ] = golden_section(func, x,  rho, epsilon, max_interaction)
%GOLDEN_SECTION minimum search method

%% initial variables set
a0 = x(1);
b0 = x(end);

counter = 0;
diff = b0 - a0; % arbitrary alrge value    
while(diff > epsilon && counter < max_interaction)
    % compute steps
    a1 = rho*(diff) + a0;
    b1 = b0 - rho*(diff);
    
    % uptate region of interest
    if(func(b1) > func(a1))
        % minimum doit etre dedans [a0 b1]
        b0 = b1;
    else
        % minimum doit etre dedans [a1 b0]
        a0 = a1;
    end
    % compute difference
    diff = abs(b0 - a0);
    counter = counter + 1;
end
Xmin = (b0+a0)/2;
end

