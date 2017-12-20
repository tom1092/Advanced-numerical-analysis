function [x,w] = generate_w(a,b,nodes,type)
% GENERATE_W calculate w_{n+1}(x) for every x included in nodes vector and return the couples 
% (point, value) for the succesive plot 
%  
%   type=0 for uniform nodes, 1 for chebyschev nodes
%
%   See also PLOT_W_UNIFORM, PLOT_W_CHEB
    
    if type == 0
        x = linspace(a,b,200);
    else
        x = linspace(min(generate_cheb_nodes(length(nodes)-1,a,b)), max(generate_cheb_nodes(length(nodes)-1,a,b)),200);
    end
    w = ones(1,length(x));
    for i=1:length(x)
        %calculate the value of the polynomial function w_{n+1} in x
        for j=1:length(nodes)
            w(i) = w(i) * (x(i)-nodes(j));
        end
    end
end