function plot_jth_bernstein_base(n,a,b,j)
% PLOT_JTH_BERNSTEIN_BASE plot the j-th bernstein base between the first
% and the last node
%
%   See also PLOT_ALL_BERNSTEIN_BASES

    x = linspace(a,b,200);
    y = zeros(1,length(x));
    for k=1:length(x)
        y(k) = compute_jth_bernstein_base_in_x(a,b,j,x(k),n);
    end
    plot(x,y, 'MarkerEdgeColor', [0.5 0.5 0.5], 'DisplayName',num2str(j));
    grid on
    grid minor
    hold on
end