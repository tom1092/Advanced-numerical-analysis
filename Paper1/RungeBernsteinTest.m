%Plot the Bernstein polynomial with n nodes (default is n=8) that
%approximate Runge function

n = 8;
x = linspace(-1,1,n);
f = zeros(1,length(x));
for i=1:length(x)
   f(i) = 1 / (1 + 25 * x(i)^2); 
end
plot_bernstein_p(f,n,min(x),max(x));