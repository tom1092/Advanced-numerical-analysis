function w = calculate_weigth_interpolation(x, plotChoose) 
    %calculate integrals of i-th lagrange bases in range [a,b] = [min(x),max(x)] 
    %and return the vector of weights w. 
    %Example of usage: check_weight_interpolation_fdq.m script
    
    w = zeros(length(x),1);
    t = linspace(min(x),max(x),200);
    l = zeros(200,1);
    for i=1:length(x)
        for j=1:length(t)
            l(j) = compute_jth_lagrange_base_in_x(x,i,t(j));
        end
        % now in l I have the ith Lagrange base (l = ith Lagrange base)
        w(i) = trapz(t, l); 
    end
    
    %plot of w for show that increasing n (i.e length of x) increase the
    %sign oscillation
    if logical(plotChoose)
        grid on
        hold on
        plot(w)
        for i =1:length(w)
           plot(i, w(i),'o');
        end 
    end
end