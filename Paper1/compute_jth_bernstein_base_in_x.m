function r = compute_jth_bernstein_base_in_x(a,b,j,x,n)
% COMPUTE_JTH_BERNSTEIN_BASE_IN_X return the value of j-th Bernstein base
% in x (with linear transormation x -> [0 ,1])
%
%   Note: n is the number of points that we use in [0,1] (i.e n=n+1)

    n = n -1; 
    if j > n || j<0
        disp('j-esima base inesistente')
        return
    end
    x = (x-a)/(b-a);
    r = nchoosek(n,j)*x^j*(1-x)^(n-j);
end