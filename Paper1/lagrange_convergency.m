function lagrange_convergency(a,b,nodes)
% LAGRANGE_CONVERGENCY plot the Lagrange interpolating polynomial and the function that must be 
% approximated (sin(2pix) and 1/(1+x^2)) to study the convergency based on
% nodes number and choice of nodes. 
%   Example of use:
%
%   Example 1
%   nodes = linspace(-5,5,4);
%   lagrange_convergency(-5,5,nodes)
%
%   Example 2
%   nodes=generate_cheb_nodes(6,-5,5);
%   lagrange_convergency(-5,5,nodes)
%
%   See also GENERATE_CHEB_NODES, PLOT_LAGRANGE_P
    
    fs = zeros(1, length(nodes));
    fr = zeros(1, length(nodes));
    for i=1:length(nodes)
        fs(i) = sin(2*pi*nodes(i));
        fr(i) = 1/(1+nodes(i)^2);
    end
    x = linspace(a,b,200);
    figure
    plot(x,sin(2*pi*x),'--');
    axis([min(x) max(x) -2 2])
    hold on;
    plot_lagrange_p(nodes,fs);
    hold off
    legend('sin(x)','interpolante di lagrange')
    figure
    plot_lagrange_p(nodes,fr);
    axis([min(x) max(x) 0 1.3])
    hold on
    for i=1:length(x)
        y(i) = 1/(1+x(i)^2);
    end
    plot(x,y,'--');
    hold off
    legend('1/(1+x^2)','interpolante di lagrange')
end