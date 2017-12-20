%Ex 8 paper 3
%Studia la stabilità della fdq interpolatoria perturbando il vettore delle
%f con errori random dell'ordine di 10^-2
%All'aumentare di n i pesi oscillano in segno e quindi non ho garanzia di
%equilimitatezza e dunque l'errore viene amplificato
figure('Name','Analisi della stabilità fdq interpolatoria: sin(x) ')
hold on
grid on

for n=2:10
   x = linspace(0,2*pi,n);
   f_x = sin(x);
   w = calculate_weigth_interpolation(x, false);
   S = f_x * w; %fdq
  
   f_x_err = f_x + (rand(1,length(x))/10); %genero errore casuali sui centesimi
   S_err = f_x_err * w; %fdq errato
   plot(n,abs(S_err - S), 'o')
end
xlabel('n');
ylabel('|S_n(f^~) - S_n(f)|');

%-----------------------------

figure('Name','e^x')
hold on
grid on

for n=2:10
   x = linspace(-4,4,n);
   f_x = exp(x);
   w = calculate_weigth_interpolation(x, false);
   S = f_x * w; %fdq
  
   f_x_err = f_x + (rand(1,length(x))/10); %genero errore casuali sui centesimi
   S_err = f_x_err * w; %fdq errato
   plot(n,abs(S_err - S), 'o')
end
xlabel('n');
ylabel('|S_n(f^~) - S_n(f)|');

%--------------------------------
figure('Name','1/(1+x^2)')
hold on
grid on

for n=2:10
   x = linspace(-5,5,n);
   f_x = zeros(1,length(x));
   for j=1:length(x)
      f_x(j) = 1/(1+(x(j)^2)); 
   end
   w = calculate_weigth_interpolation(x, false);
   S = f_x * w; %fdq
   
   f_x_err = f_x + (rand(1,length(x))/10); %genero errore casuali sui centesimi
   S_err = f_x_err * w; %fdq errato
   plot(n,abs(S_err - S), 'o')
end
xlabel('n');
ylabel('|S_n(f^~) - S_n(f)|');