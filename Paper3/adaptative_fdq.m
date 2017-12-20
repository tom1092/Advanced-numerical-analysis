function I = adaptative_fdq (a,b,n,f, err)
%ex 17. NB: #punti = n+1
%suppongo f data in forma simbolica come ad esempio f = @(x)sin(x)
%Example of usage with symbolic:
%f = @(x)sin(x);
%adaptative_fdq(1,8,5,f,0.001)

    if ~exist('I','var')
       I = 0; 
    end

    x = linspace(a,b,(n+1));
    x2 = generate_interPoints(x);
    S = generic_trapz_composite(x, f(x)); %S_n+1
    Sd = generic_trapz_composite(x2,f(x2)); %S_2n+1 
    R = (Sd - S)/3;
    if abs(R) < err
        I = I + (4*Sd - S)/3;
    else
        I = I + adaptative_fdq(x2(1),x2(length(x)-1),n,f, err);
        I = I + adaptative_fdq(x2(length(x)),x2(length(x2)),n,f, err);
    end
end

function p = generate_interPoints(x)
    %dato x di dimensione n+1 restituisce p di dimensione 2n+1 punti
    %(con punti costruiti tra i vari nodi di x)
    n = length(x)-1;
    p = zeros(1, (2*n)+1);
    j = 1;
    for i=1:length(x)
       p(j) = x(i); %posizioni dispari uguali al vettore dei nodi iniziale
       j = j + 2;
    end

    j=1;
    for i=2:2:length(p)
        p(i) = (x(j)+x(j+1))/2; %posizioni dispari pari al punto medio dei vari nodi iniziali
        j = j + 1;
    end
end