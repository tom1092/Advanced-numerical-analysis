function plot_Bspline_interpolating_pol (x, f, p)
%Ex 14 paper 1 (Disegna spline interpolanti di grado 1)
%f deve essere un vettore colonna
    
    y = x;
    m = length(y)-2;
    M = zeros(length(x));
    
    for i=1:length(f)
       for j=1:length(f)
          M(i,j) = ith_Bspline_in_x(y,i,p,x(j));
       end
    end

    disp(M)
    
    t = linspace(min(y), max(y), 200);
    ft = zeros(1, length(t));
    a = inv(M)*f;
    for i=1:length(t)
        for j=1:length(a) %length(a) = m+p+1
            ft(i) = a(j) * ith_Bspline_in_x(y, j, p, t(i));
        end
    end
    
    plot(t,ft)
end