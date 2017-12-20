function R = error_estimate_compositeTrapz(x,f)
%Ex 15 paper 3
%Nota: Bisogna passare un vettore di dimensione dispari e con nodi x distribuiti
%uniformemente.
%Example of usage:
%x = 1:9
%f = randi(5, 1, length(x)) genera vettore di lunghezza length(x) composto
%da numeri compresi tra 1 e 5
%R = error_estimate_compositeTrapz(x,f)

    S_d = trapz(x,f); %fdq calcolata su 2n+1 punti
    
    z = x(1:2:length(x));
    fz = f(1:2:length(f));
    S = trapz(z,fz); %fdq calcolata su n+1 punti

    R = (S_d - S)/3; 
    
end