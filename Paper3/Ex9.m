function Ex9 (a ,b ,n)
%Ex 9 paper 3
%Implementa e graficizza la formula di Newton-Cotes con n<5 punti e
%controlla l'esattezza dell'integrale su monomi fino a grado 2n-1
%scegliendo come f(x) = |x(sin(x))|
%Lo studio del gdp è stato effettuato con al massimo 4 punti
%Example of usage: Ex9 (-1, 5, 3)

t = linspace(a,b,200);
ft = zeros(1,length(t));
for i=1:length(t)
   ft(i) = 2*t(i)^2 - t(i) + 1; 
end

hold on

x = linspace(a,b,n); %x vettore di dimensione n
f = zeros(1,length(x));
for i=1:length(x)
   f(i) = 2*x(i)^2 - x(i) + 1; 
end

yarea = plot_lagrange_p(x,f);
area(t,yarea);

plot(t,ft);

%-------------------------
for k=(n-1):(2*n-1)
    disp('controllo errore su il monomio di grado');
    disp(k);
    check_gdp_formule_chiuse(a,b,k,n) %controlla gdp su monomio x^(n-1)
    disp('/----------------------------/');
end