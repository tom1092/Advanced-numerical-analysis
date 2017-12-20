function Ex10 (a,b,n)
%Ex 10 
%Il vettore dei nodi è dato dal vettore di n nodi uniformi tra a e b
%esclusi gli estremi stessi a e b.
%Non è implementato lo studio del grado di precisione

t = linspace(a,b,200);
ft = zeros(1,length(t));
for i=1:length(t)
   ft(i) = abs(t(i)*sin(t(i))); 
end

hold on

x = linspace(a,b,n); %x vettore di dimensione n
x = x(2:(length(x)-1));%x senza gli estremi (dimensione di x = n-2)

f = zeros(1,length(x));
for i=1:length(x)
   f(i) = abs(x(i)*sin(x(i))); 
end

yarea = plot_lagrange_p(x,f);
area(t,yarea);

plot(t,ft);

end