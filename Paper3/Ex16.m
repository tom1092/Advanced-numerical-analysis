%Ex16
%Confrontare con ExactError ex7paper3

approxError = zeros(1, 11);
for n=3:10 %da 2 non va bene perchè error_estimate costruirebbe una fdq trap su un punto: errore!
   x = linspace(0,2*pi,n);
   f_x = sin(x); 
   j = 1;
   approxError(j) = error_estimate_compositeTrapz(x, f_x);
   j = j+1;
end