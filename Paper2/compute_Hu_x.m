function Hu_x = compute_Hu_x(x)
%Ex 5 paper 2
%Example of usage:
% x = [ 2 2 1]';
% compute_Hu_x(x);

    u = x-norm(x)*eye(length(x),1); 
    Beta = 2/(u'*u);
    Gamma = u'* x;
    Hu_x = x-Beta*Gamma*u;
end