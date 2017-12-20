%Ex 6 paper 3
%Plotta i pesi costruiti con il metodo dei coefficienti indeterminati con
%nodi x = 0:1:n

disp('La matrice di vandermonde per n grande è talmente mal condizionata che matlab restituisce un valore del rango inferiore')
disp('Per questo ci limitiamo a n=10')
for n=2:2:10
   x = 0:1:n;
   w = calculate_weight_fdq_indeterminateCoeff(x,min(x),max(x));
   figure
   plot(w)
   grid on
   hold on
   for i =1:length(w)
      plot(i, w(i),'o');
   end
   legend(num2str(n));
end