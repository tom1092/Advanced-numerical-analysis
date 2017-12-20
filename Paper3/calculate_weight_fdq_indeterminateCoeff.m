function w = calculate_weight_fdq_indeterminateCoeff(x, a, b)
%Ex 5 paper 3: calcola i pesi della fdq usando il metodo dei coefficienti
%indeterminati

    A = vander(x)'; %create Vandermonde matrix transposed
    A = flipud(A); %Up/Down overturning
    
    f = zeros(length(x),1);
    for i=1:length(x) %length(x)=n+1
        f(i) = (b^i - a^i)/i;
    end
    
    [w, f_min] = least_squares_solver(A,f); %f_min dovrà essere 0

end

%Test check:
%integrate from 1 to 3 the function f(x) = x^2 (result = 8.66)
%w = calculate_weight_fdq_indeterminateCoeff(x,1,3)
%then [1 4 9] * w = 8.66 
