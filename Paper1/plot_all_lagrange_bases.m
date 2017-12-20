function plot_all_lagrange_bases(nodes)
% PLOT_ALL_LAGRANGE_BASES draws all Lagrange bases builded over an array of nodes 
%   Example of use: plot_all_lagrange_bases([-2 1 5 7])
%
%   See also COMPUTE_JTH_LAGRANGE_BASE_IN_X, PLOT_JTH_LAGRANGE_BASE, PLOT_LAGRANGE_P
    
    figure    
    for i=1:length(nodes)
        plot_jth_lagrange_base(nodes,i);  
    end
    
end
