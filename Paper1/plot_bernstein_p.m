function y = plot_bernstein_p(f,n,a,b)
%plotta il polinomio di bernstein associato al vettore degli f e a n nodi
%scelti uniformemente in [a,b]

    if length(f) ~= n
       disp('Impossibile: numero di nodi diverso dal numero di valori della funzione')
       return
    end

    x = linspace(a,b,200);
    y = zeros(1,length(x));
    for i=1:length(x)
        y(i) = compute_bernstein_p_in_x(f,n,a,b,x(i));
    end
    plot(x,y, 'MarkerEdgeColor', [0.5 0.5 0.5])
    grid on
    grid minor
    hold on
    
    nodes = linspace(a,b,n);
    for i=1:n
        plot(nodes(i),f(i),'-o', 'MarkerSize',10)
    end
end

function sum = compute_bernstein_p_in_x(f, n, a, b, x)
%ritorna il valore del polinomio di bernstein
%n = numero di nodi
    sum = 0;
    for j=0:(n-1)
        sum = sum + f(j+1)*compute_jth_bernstein_base_in_x(a,b,j,x,n);
    end
end