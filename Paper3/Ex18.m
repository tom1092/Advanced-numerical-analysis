%Ex18
x = linspace(0,2*pi,200);
f = zeros(1,length(x));
f(1:(length(x)/8)) = sin(6 * x(1:(length(x)/8)));
f((length(x)/8 + 1):length(x)) = (x((length(x)/8 + 1):length(x))).^2 - ((pi+1)/4);

adaptative_fdq(0, pi, 5, f, 0.01)
