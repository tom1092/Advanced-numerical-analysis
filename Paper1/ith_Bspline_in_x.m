function Bs = ith_Bspline_in_x(y, i, p, x)
% ITH_BSPLINE_IN_X add 2p fictitious nodes and call the recursive function that calculate
% the Bspline in a x point
%
%   Note: the bases are numbered from 1 to m+p+1
%
%   See also COMPUTE_ITH_BSPLINE_IN_X
    
    m = length(y)-2;
    if i<=0 || i>(m+p+1)
       error('i-th base not calculable'); 
    elseif x<min(y) || x>max(y)
       error('x too small or too big'); 
    end

    %add 2p fictitious nodes (p at left and p at right)
    a = ones(1,p)*min(y);
    z = p:-1:1;
    a = a - z; %vector of p fictitious nodes at left
    b = ones(1,p)*max(y);
    z = 1:p;
    b = b + z; %vector of p fictitious nodes at right
    y = horzcat(a,y,b);
    
    Bs = compute_ith_Bspline_in_x(y, i, p, x);
end

function BSx = compute_ith_Bspline_in_x (y, i, p, x)
%Apply the Bspline recursive formula to calculate the ith Bspline of p degree in x 
    
    if p == 0
       BSx = 0;
       if x>=y(i) && x<y(i+1)
           BSx = 1;
       end
    else
        BSpm_i = compute_ith_Bspline_in_x(y,i,p-1,x);
        BSpm_im = compute_ith_Bspline_in_x(y,i+1,p-1,x);
        BSx = ((x - y(i))/(y(i+p)-y(i)))*BSpm_i + ((y(i+p+1)-x)/(y(i+p+1)-y(i+1)))*BSpm_im;
    end

end