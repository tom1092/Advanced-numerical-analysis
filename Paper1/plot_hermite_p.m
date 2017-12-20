function plot_hermite_p(nodes,f,g)
% PLOT_HERMITE_P calculate the Hermite polynomial over (nodes,f,g) g=f' and
% plot this polynomial function.
%    
%   Example of use:
%   nodes = [-2 1 3];
%   f = [4 0 -2];
%   g = [1 0 0.5];
%   plot_hermite_p(nodes,f,g);
%
%   See also COMPUTE_JTH_HERMITE_BASE_IN_X
    
    
    if length(nodes) ~= length(f)
        error('error: number of nodes not equal to the number of values function')
    end
    x = linspace(min(nodes)-1,max(nodes)+1,200);
    y = zeros(1,length(x));
    for i=1:length(x)
        y(i) = compute_hermite_p_in_x(nodes,f,g,x(i));
    end
    figure
    %axis([-10 10)
    %disp (y)
    plot(x,y, 'MarkerEdgeColor', [0.5 0.5 0.5])
    %axis([min(nodes)-2 max(nodes)+2 min(f)-2 max(f)+2])
    grid on
    grid minor
    hold on
    d = 0.5;
    %for every nodes plots Marker and the tangent line around it
    for i=1:length(nodes)
        plot(nodes(i),f(i),'-o', 'MarkerSize',10)
        x_tan = linspace(nodes(i)-d,nodes(i)+d,200);
        y_tan = zeros(1,length(x));
        for k=1:length(x_tan)
            y_tan(k) = f(i)+g(i)*(x_tan(k)-nodes(i));
        end
        plot(x_tan,y_tan);
    end
    
end

function sum = compute_hermite_p_in_x(nodes,f,g,x)
%return the value of Hermite polynomial function in x
    sum = 0;
    for j=1:length(nodes)
        [uj, vj] = compute_jth_hermite_base_in_x(nodes,j,x);
        sum = sum + f(j)*uj+g(j)*vj;
    end
end
