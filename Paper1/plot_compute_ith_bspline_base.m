function plot_compute_ith_bspline_base(y, i, p)
% PLOT_ITH_BSPLINE_BASE plot the i-th Bspline of p degree constructed on y
% nodes
%
%   See also PLOT_ALL_BSPLINE_BASES

    t = linspace(min(y),max(y),200);
    z = zeros(1,length(t));
    for j=1:length(t)
        z(j) = ith_Bspline_in_x(y,i,p,t(j));
    end
    
    grid on;
    plot(t,z);
end