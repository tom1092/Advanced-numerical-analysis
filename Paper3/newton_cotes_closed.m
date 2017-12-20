function [St, Scs, S38, S5] = newton_cotes_closed(x, f)
%Ex9: x deve essere un vettore uniforme di dimensione almeno 5?
    
    if length(f) ~= length(x)
       error('x ed f devono essere della stessa lunghezza');
    end
    n = length(x);
    h = (x(n)-x(1))/n;
    
    St = 0.5*h*(f(1) + f(n));
    
    Scs = 0;
    S38 = 0;
    S5 = 0;

end