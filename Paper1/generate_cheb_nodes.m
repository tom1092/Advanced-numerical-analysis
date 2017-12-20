function nodes=generate_cheb_nodes(n,a,b)
%return the vector of n+1 nodes of chebyschev in [a,b]
    x = zeros(1,n+1);
    nodes = zeros(1,n+1);
    if a>=b
        disp('Choose right iterval')
        return
    end
    for i=1:n+1
        x(i) = cos((2*pi*(i-1)+1)/(2*(n+1)));
        nodes(i) = (b-a)*x(i)/2 + (b+a)/2;
    end
end