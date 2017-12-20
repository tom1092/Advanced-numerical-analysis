function plot_all_hermite_bases(nodes)
    %Ex 9 paper 1
    %chiama le funzioni di utilit� per disegnare tutte le basi di hermite
    %su un array di nodi nodes
    %Example of usage plot_all_hermite_bases([-1 2 5 7])
    figure    
    for i=1:length(nodes)
        plot_jth_hermite_base(nodes,i);  
    end
end