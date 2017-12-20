function Hu = create_Hu(u)
%Ex 4 paper 2
%Example of usage: 
% u = [1 -4 2 3]';
% Hu = create_Hu(u);
%Riprova per ortogonalità Hu*Hu'

    Hu = eye(length(u))-(2*u*u')/(u'*u); %u devo passare come vettore colonna
end