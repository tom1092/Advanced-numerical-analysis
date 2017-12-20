function S = generic_trapz_composite(x, f)
    %formula dei trapezi composita
    
    a = x(1);
    b = x(length(x));
    n = length(x);
    h = (b-a)/(n-1);
    S = (h/2)*(f(1)+f(length(x)));
    for i=2:(length(x)-1)
        S = S + (h * f(i));
    end
    
    for i=1:(length(x)-1)
       area([x(i) x(i+1)], [f(i) f(i+1)])
       hold on
    end
end