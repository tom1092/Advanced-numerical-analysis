%Ex7 paper 3 
%Plotta la differenza (per tre diverse funzioni) tra l'integrale esatto e la fdq costruita su n punti
%dati (n da 2 a 10) 

% t = linspace(0,2*pi,200);
% f_t = sin(t);
% I = trapz(t, f_t);

f = @(x)(sin(x));
I = integral(f,0,2*pi);

figure('Name','sin(x)')
hold on
grid on

ExactError = zeros(1,19); %aggiunta per ex 16
for n=2:10
   x = linspace(0,2*pi,n);
   f_x = sin(x);
   w = calculate_weigth_interpolation(x, false);
   S = f_x * w; %fdq
   plot(n,I-S, 'o')
   
   %Aggiunte per ex 16
   j = 1;
   ExactError(j) = I -S;
   j = j+1;
end

%-----------------------------------

figure('Name','e^x')
grid on
hold on

t = linspace(-4,4,200);
f_t = exp(t);
trapz(t, f_t);
I = trapz(t, f_t);

for n=2:10
   x = linspace(-4,4,n);
   f_x = exp(x);
   w = calculate_weigth_interpolation(x, false);
   S = f_x * w; %fdq
   plot(n,I-S, 'o')
end

%-----------------------------------

figure('Name','1/(1+x^2)')
hold on
grid on

t = linspace(-5,5,200);
f_t = zeros(1,length(t));
for j=1:length(t)
   f_t(j) = 1 / (1 + (t(j)^2)); 
end
trapz(t, f_t);
I = trapz(t, f_t);

for n=2:10
   x = linspace(-5,5,n);
   f_x = zeros(1,length(x));
   for j=1:length(x)
      f_x(j) = 1/(1+(x(j)^2)); 
   end
   w = calculate_weigth_interpolation(x, false);
   S = f_x * w; %fdq
   plot(n,I-S, 'o')
end
