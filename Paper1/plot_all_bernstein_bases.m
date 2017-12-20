function plot_all_bernstein_bases(n,a,b)
% PLOT_ALL_BERNSTEIN_BASES plot all Bernstein bases in [a,b] with n-1
% uniform nodes calculated 
%   Example of use: plot_all_bernstein_bases(5,-1,6)
%
%   See also PLOT_JTH_BERNSTEIN_BASE

    for i=0:(n-1)
        plot_jth_bernstein_base(n,a,b,i);
    end
    legend('show');
end