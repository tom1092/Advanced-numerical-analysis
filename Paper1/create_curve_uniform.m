function create_curve_uniform (x, y)
% CREATE_CURVE_UNIFORM plot the curve with support (x(t), y(t)) with t
% uniform in [0, 1]
%
%   Example of use:
%   z = linspace(0, 2*pi, 50); 
%   x = 2 * cos(z);
%   y = 2 * sin(z);
%   create_curve_uniform(x,y)
%
%   See also PLOT_LAGRANGE_P

if length(x) ~= length(y)
   disp('Errore: x ed y devono avere la stessa dimensione'); 
   return;
end

t = linspace(0, 1, length(x));
xCp = plot_lagrange_p(t, x); 
yCp = plot_lagrange_p(t, y);
figure
hold on
grid on
plot(xCp, yCp)
plot(x,y,'o')
axis('equal')

end