function best_trigonometric_polinomial_fit(x, f, m)
%Ex 9 paper 2
%costruisce e disegna l'approssimante trigonometrico nel senso dei minimi
%quadrati, m è il numero di armoniche per il coseno (nel caso sia
%un'interpolazione un seno ad alta frequenza viene tolto)
%NB: Nel caso che il numero di nodi pari non funziona perchè tenta sempre di interpolare
%Example of usage
% x = [-4 -2 1 5 7 10 11];
% f = [1 5 -1 0 1 3 2]';
% best_trigonometric_polinomial_fit(x,f,1)
% best_trigonometric_polinomial_fit(x,f,2)
    
    n = length(x);
    M = 2*m + 1;
    if n < M
       disp('Hai inserito troppi pochi per avere fino alla armonica m. Il numero di nodi deve essere non minore di 2m +1'); 
       return;
    end
    if n==M
       disp('Con questo numero di nodi e con questo numero di armoniche stai cercando di interpolare. Usa la funziona dedicata.');
       return;
    end
    A = ones(n,M);
    for i=1:m %ciclo m-volte per costruire la matrice (alla fine ottengo una matrice di dimensioni nxM)
        %Ad ogni ciclo setto la colonna 2i-esima con cos(ix) e la colonna 2i+1 - esima con sin(ix)
        A(:,(2*i)) = cos(i*x)';
        A(:,(2*i+1)) = sin(i*x)';
    end
    
    
    [coeff, fMin] = least_squares_solver(A, f); %coeff=[a0/2 cos sin cos2x sin2x)
    t = linspace(min(x), max(x), 200);
    y = ones(length(t),1) * (coeff(1)); 
     for i=1:length(t)
        k = 1;
        for j=2:2:M
            y(i) = y(i) + coeff(j)*(cos(t(i)*k)) + coeff(j+1)*(sin(t(i)*k));
            k = k + 1;
        end
    end
%   end
    
    grid on
    hold on
    %axis([min(x)-2 max(x)+2 min(y)-2 max(y)+2]) 
    plot(x, f, 'o')
    plot(t, y)

end