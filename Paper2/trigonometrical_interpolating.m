function trigonometrical_interpolating(x, f)
%Ex 10 & 11 paper 2
%Costruisce e disegna l'interpolante trigonometrico sia in caso di nodi
%pari che dispari
%Example of usage: CheckEx10and11.m script

    n = length(x);
    even = false;
    if mod(n,2)==0
        even = true;
    end
    if even %il numero di nodi � pari devo gestire l'eliminazione di un seno ad alta frequenza
        m = n/2;
        A = ones(n,n);
        for i=1:m-1 %ciclo m-1 volte per costruire la matrice (alla fine ottengo una matrice di dimensioni nxn aggiungendo l'ultimo coseno)
            %Ad ogni ciclo setto la colonna 2i-esima con cos(ix) e la colonna 2i+1 - esima con sin(ix)
            A(:,(2*i)) = cos(i*x)';
            A(:,(2*i+1)) = sin(i*x)';
        end
        %setto l'ultimo coseno
        A(:,n) = cos(m*x)';
    else %altrimenti il numero di nodi � dispari
        m = (n-1)/2;
        A = ones(n,n);
        for i=1:m %ciclo m-volte per costruire la matrice (alla fine ottengo una matrice di dimensioni nxM)
            %Ad ogni ciclo setto la colonna 2i-esima con cos(ix) e la colonna 2i+1 - esima con sin(ix)
            A(:,(2*i)) = cos(i*x)';
            A(:,(2*i+1)) = sin(i*x)';
        end
    end
    [coeff, fMin] = least_squares_solver(A, f); %coeff=[a0/2 cos sin cos2x sin2x)
    t = linspace(min(x), max(x), 200);
    y = ones(length(t),1) * (coeff(1));
    if even
        for i=1:length(t)
            k = 1;
            for j=2:2:n-2
                y(i) = y(i) + coeff(j)*(cos(t(i)*k)) + coeff(j+1)*(sin(t(i)*k));
                k = k + 1;
            end
            %sommo l'ultimo coseno che ho perso
            y(i) = y(i) + coeff(n)*(cos(t(i)*k));
        end
    else %altrimenti numero di nodi dispari procedo normalmente
        for i=1:length(t)
            k = 1;
            for j=2:2:n
                y(i) = y(i) + coeff(j)*(cos(t(i)*k)) + coeff(j+1)*(sin(t(i)*k));
                k = k + 1;
            end
        end
    end
    grid on
    hold on
    %axis([min(x)-2 max(x)+2 min(y)-2 max(y)+2]) 
    plot(x, f, 'o')
    plot(t, y)
end