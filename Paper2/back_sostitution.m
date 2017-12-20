function x = back_sostitution(R,b)
%Ex 2 paper 2
%Data in ingresso una materice tringolare superiore ed un vettore b
%risolve il sistema Rx = b con la sostituzione all'indietro
%Example of usage: 
% R =[1 5 4;0 2 -1; 0 0 1];
% b = [ 2 -1 5]';
% x = back_sostitution(R,b)
% Riprova R*x'

    if istriu(R)==0
        disp('Matrice non triangolare sup')
        return
    end
    n = length(R(:,1));
    x = zeros(1,n);
    for i=n:-1:1
         z = 0;
        for j=i+1:n
            z = z+R(i,j)*x(j);
        end
       
        x(i) = (b(i)-z)/R(i,i);
    end
   
end