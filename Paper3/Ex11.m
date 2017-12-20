function Ex11 (a, b, n)
    %Ex 11 paper 3 (#punti = n)
    %Example of usage: Ex11(-1,5,10)
    %Studio del grado di precisione non implementato
    
    x = linspace(a, b, n);
    h = (b-a)/(n-1);
    f = zeros(1, length(x));
    for i=1:length(x)
       f(i) = x(i)*sin(x(i)); 
    end
    S = (h/2)*(f(1)+f(length(x)))
    for i=2:(length(x)-1)
        S = S + (h * f(i));
    end
    
    %Semplice riprova
    disp('Valore calcolato: ');
    S
    disp('Valore calcolato con trapz: ');
    trapz(x, f)
    
    figure('Name','Trapezi composita visualizzazione');
    %plot dei trapezi
    for i=1:(length(x)-1)
       area([x(i) x(i+1)], [f(i) f(i+1)])
       hold on
    end
end