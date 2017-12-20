function y = compute_jth_lagrange_base_in_x(nodes, j, x)
% COMPUTE_JTH_LAGRANGE_BASE_IN_X return the value of the j-th Lagrange base calculated in x point 
%   Example of use: compute_jth_lagrange_base_in_x([1 2 6 4],2,3)
%
%   See also PLOT_JTH_LAGRANGE_BASE, PLOT_ALL_LAGRANGE_BASES, PLOT_LAGRANGE_P

    if j > length(nodes) || j<1
        error('j-th base not exist')
    end
    y = 1;
    for i=1:length(nodes)
        if i~=j
            y = y * (x-nodes(i))/ (nodes(j)-nodes(i));
        end
    end
end