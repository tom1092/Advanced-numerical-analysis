function plot_jth_lagrange_base(nodes, j)
% PLOT_JTH_LAGRANGE_BASE plot the j-th Lagrange base builded on 100 points placed between the first and the last node.
%   Example of use: plot_jth_lagrange_base([-2 1 5 7], 2)
%
%   See also COMPUTE_JTH_LAGRANGE_BASE_IN_X, PLOT_ALL_LAGRANGE_BASES, PLOT_LAGRANGE_P

    x = linspace(min(nodes),max(nodes),100);
    y = zeros(1,length(x));
        for k=1:length(x)
            y(k) = compute_jth_lagrange_base_in_x(nodes,j,x(k));
        end
    plot(x,y, 'MarkerEdgeColor', [0.5 0.5 0.5])
    grid on
    grid minor
    hold on
    draw_dots(nodes,j);
end

function draw_dots(nodes,j)%draw the points on the nodes values
    for i=1:length(nodes)
        if i==j
            plot(nodes(i),1,'-o', 'MarkerSize',10)
        else
            plot(nodes(i),0,'-o', 'MarkerSize',10)
        end
    end
end