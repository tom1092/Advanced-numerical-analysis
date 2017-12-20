function y = plot_lagrange_p(nodes,f)
% PLOT_LAGRANGE_P plot the Lagrange interpolating polynomial
% over (nodes, f) and return the function values of the Lagrange interpolating polynomial
%   Example of usage: y = plot_lagrange_p([-2 1 5 7], [1 -1 3 -2]);
% 
%   See also COMPUTE_JTH_LAGRANGE_BASE_IN_X, PLOT_JTH_LAGRANGE_BASE, PLOT_ALL_LAGRANGE_BASES

    if length(nodes) ~= length(f)
        error('error: number of nodes not equal to the number of values function')
    end
    x = linspace(min(nodes),max(nodes),200);
    y = zeros(1,length(x));
    for i=1:length(x)
        y(i) = compute_lagrange_p_in_x(nodes,f,x(i));
    end
    plot(x,y, 'MarkerEdgeColor', [0.5 0.5 0.5])
    grid on
    grid minor
    hold on
    for i=1:length(nodes)
        plot(nodes(i),f(i),'-o', 'MarkerSize',10)
    end
end

function sum = compute_lagrange_p_in_x(nodes,f,x)
%return the value of the Lagrange polynomial function calculated in x 
    sum = 0;
    for j=1:length(nodes)
        sum = sum + f(j)*compute_jth_lagrange_base_in_x(nodes,j,x);
    end
end

