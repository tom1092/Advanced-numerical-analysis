function least_square_es8(x, f, n)
    %Ex 8 paper 2
    %Costruisce e disegna il polinomio di migliore approssimazione ai
    %minimi quadrati di grado n<m con m = dimensione di x (o di f).
    %NOTA: f deve essere dato come vettore colonna
    %Example of usage
    %x = [-1 1 2 5 7];
    %f = [1 0 3 -2 2]';
    % least_square_es8(x,f,1);
    % least_square_es8(x,f,2);
    % least_square_es8(x,f,3);
    % least_square_es8(x,f,4);
    
    if n>=length(x)
        disp('errore grado troppo elevato')
       return; 
    end
    A = vander(x);
    A = fliplr(A); %inverte specularmente le colonne di A
    A = A(1:length(A(:,1)), 1:(n+1)); %prende la sottomatrice con numero di righe pari ad A
    %e numero colonne pari a n+1 (dato che per costruire pol di grado n mi
    %servono n+1 punti)
    [coeff, fMin] = least_squares_solver(A, f);
    t = linspace(min(x), max(x), 200);
    y = zeros(length(t),1);
    
    %disegna il polinomio di migliore approssimazione ai minimi quadrati
    for i=1:length(t)
       for j=1:length(coeff)
           y(i) = y(i) + coeff(j)*(t(i)^(j-1)); %calcola il valore del polinomio nel 
       end
    end
    grid on
    hold on
    %axis([min(x)-2 max(x)+2 min(y)-2 max(y)+2]) 
    plot(x, f, 'o')
    plot(t, y)
end