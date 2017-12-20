function [x_min, f_min] = least_squares_solver(A,b)
    %Ex7 paper 2
    %Risolve il problema dei minimi quadrati usando la QR
    %Nota: b va passato come vettore colonna
    %Example of usage:
    %A = [1 9 5; 4 2 1; 0 1 3; 7 1 -1];
    %b = [5 0 -3 1]';
    %[xMin, fMin] = least_squares_solver(A,b)
    
    m = length(A(:,1));
    n = length(A(1,:));
    if rank(A)< min(m,n)
        disp('Rango di A non massimo');
        return;
    end
    [Q, R] = QR_fact(A);
    dimU = min(size(R)); %dimensione della matrice U quadrata estratta da R (rettangolare)
    U = R(1:dimU, 1:dimU);
    c = ((Q')*b); 
    c1 = c(1:dimU);
    %x_min = back_sostitution(U, c1); %non funziona perchè non riconosce il
    %numero 0 (della matrice U) come effettivamente 0 per problemi numerici
    %In sintesi non vede la matrice U come triangolare superiore
    x_min = inv(U) * c1;
    f_min = norm(A * x_min - b)^2;
    %ps: per verificare se x_min è soluzione del sistema Ax=b f_min dovrà
    %essere uguale a 0 (circa)
end
