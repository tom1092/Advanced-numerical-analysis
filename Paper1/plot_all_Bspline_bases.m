function plot_all_Bspline_bases (y, p)
% PLOT_ALL_BSPLINE_BASES plot all Bspline of p degreee in [min(y) max(y)]
%   Example of use:  plot_all_Bspline_bases([-1 4 8 9 12], 3)
% 
%   See also PLOT_COMPUTE_ITH_BSPLINE_BASE

    m = length(y) -2;
    hold on
    axis([min(y) max(y) 0 1.1]);
    for i=1:(m+p+1)
        plot_compute_ith_bspline_base(y, i, p);
    end

end