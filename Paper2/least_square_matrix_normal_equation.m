function [m,fm] = least_square_matrix_normal_equation(A,b)
%Ex 3 paper 2
%Risolve il sistema lineare Ax=b nel senso dei minimi quadrati con il metodo delle equazioni normali
%Example of usage: 
% A = [1 -1 2 0;-2 3 1 1; 4 1 -1 0];
% b = [1 -2 3]';
% [m, fm] = least_square_matrix_normal_equation(A,b)
   
    if rank(A)<min(length(A(:,1)),length(A(1,:)))
        return 
    end
    m = inv(A'*A)*A'*b;
    fm = A*m - b;
end