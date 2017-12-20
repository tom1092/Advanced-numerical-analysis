function Ex12 (a, b, m)
%implementa e graficizza la formula la regola di Simpson sui nodi uniformi
%x_0...x_2m (cioè su 2m+1 nodi uniformi)
%Example of usage: Ex12(1,5,10)
%Studio del grado di precisione non implementato

    x = linspace(a, b, (2*m + 1));
    h = (b-a)/(2*m);
    f = zeros(1, length(x));
    for i=1:length(x)
       f(i) = x(i)*exp(-x(i)); 
    end
    S = f(1)+f(length(x));
    for i=2:2:(2*m)
       S = S + 4*(f(i));
    end
    for i=3:2:(2*m)
       S = S + 2*(f(i));
    end
    S = (h/3)*S;
    
    disp('Valore calcolato: ');
    S
    
    figure('Name','Cavalieri simpson composita visualizzazione');
    %plot dei trapezi
    for i=1:2:(2*m-1)
       t = linspace(x(i), x(i+2), 200);
       ft = plot_lagrange_p(x(i:(i+2)), f(i:(i+2))); 
       area(t, ft)
       hold on
    end
    
end