function plot_jth_hermite_base(nodes,j)
% PLOT_JTH_HERMITE_BASE plot the j-th bases calculated over 200 points between the
% first and the last node
%   Example of usage: plot_jth_hermite_base([-1 2 5 7], 2)
%
%   See also COMPUTE_JTH_HERMITE_BASE_IN_X, PLOT_ALL_HERMITE_BASES, PLOT_HERMITE_P
    
    x = linspace(min(nodes),max(nodes),200);
    y_uj = zeros(1,length(x));
    y_vj = zeros(1,length(x));
    for k=1:length(x)
        [uj , vj] = compute_jth_hermite_base_in_x(nodes,j,x(k));
        y_uj(k) = uj;
        y_vj(k) = vj;
    end
    plot(x,y_uj, 'MarkerEdgeColor', [0.5 0.5 0.5])
    grid on
    grid minor
    hold on
    plot(x,y_vj, 'MarkerEdgeColor', [0.5 0.5 0.5])
    legend('u_j','v_j', 'AutoUpdate', 'off');
    draw_dots(nodes,j)
end

function draw_dots(nodes,j)%disegna i "pallini" sul valore dei nodi
    for i=1:length(nodes)
        if i==j
            plot(nodes(i),1,'-o', 'MarkerSize',10)
        end
        plot(nodes(i),0,'-o', 'MarkerSize',10)
    end
end