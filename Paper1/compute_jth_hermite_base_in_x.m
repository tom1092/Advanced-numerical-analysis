function [u_j,v_j] = compute_jth_hermite_base_in_x(nodes, j, x)
% COMPUTE_JTH_HERMITE_BASE_IN_X return the couple of values of the bases u_j e v_j calculated in x
%
%   See also PLOT_JTH_HERMITE_BASE, PLOT_ALL_HERMITE_BASES, PLOT_HERMITE_P

    if j > length(nodes) || j<1
        disp('j-esima base inesistente')
        return
    end
    eps = 10^(-6);
    ljx = compute_jth_lagrange_base_in_x(nodes,j,x);
    u_j = (ljx^2)*(1-2*(x-nodes(j))*(compute_jth_lagrange_base_in_x(nodes,j,x+eps)-ljx)/eps);
    v_j = (ljx^2)*(x-nodes(j));
end