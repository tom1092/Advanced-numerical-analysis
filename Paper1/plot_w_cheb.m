function plot_w_cheb(a, b, degrees)
% PLOT_W_CHEB calculate the polynomial functions w_{n+1}(x) for x in
% [a,b] (Chebyschev nodes) and plot these functions on different subplots for
% every degree n passed by argument
%
%   Example of use: plot_w_cheb(-3, 3, [2 5 7 10])
%
%See also GENERATE_W, PLOT_W_UNIFORM
    
    if length(degrees)>4
        disp('max 4 subplot')
        return
    end
    for i=1:length(degrees)
        subplot(2,2,i)
        [x,w] = generate_w(a,b,generate_cheb_nodes(degrees(i),a,b),1);
        plot(x,w)
        s1 = 'Subplot w_{n+1} with n= ';
        s2 = num2str(degrees(i));
        title(strcat(s1,s2))
    end
end