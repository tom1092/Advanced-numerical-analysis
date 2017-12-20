function check_gdp_formule_chiuse(a,b,k,n)

    x = linspace(a,b,n);
    
    %Studio del grado di precisione per il monomio x^(k)
    h = (b-a)/(n-1);

    f = zeros(1,n);
    for i=1:length(f)
       f(i) = x(i)^(k); 
    end

    if n==2
        Vc = (h/2)*(f(1)+f(2));
    elseif n==3
        Vc = (h/3)*(f(1)+4*f(2)+f(3));
    elseif n==4
        Vc = ((3*h)/8)*(f(1)+3*f(2)+3*f(3)+f(4));
    end
    Ve = (b^(k+1) - a^(k+1))/(k+1);
    disp('Errore tra integrale esatto e calcolato con la fdq di Newton Cotes:')
    disp(Vc - Ve);

end