function create_curve_distance(P)
% CREATE_CURVE_DISTANCE construct the interpolating curve using the
% parametrization curve arc
%
%   Example 1 of use:
%   points = [[-5, 1]; [-4, 2]; [1, 4]; [6, 0]; [2, -4]; [-4 ,0]; [-5, 1]];
%   create_curve_distance(points)
%
%   Example 2 of use:
%   t = linspace(0, 2, 50);
%   x = cos(2* pi *t);
%   y = sin(2*pi*t);
%   z = t;
%   P = [x' y' z'];
%   create_curve_distance(P)
%
%   See also DISTANCEPOINTS, PLOT_LAGRANGE_P


t = zeros(length(P(:,1)),1);
for i=2:length(t)
   t(i) = t(i-1) + distancePoints(P(i-1,:), P(i,:)); 
end
x = P(:,1); %first component of all points
y = P(:,2);
xCp = plot_lagrange_p(t, x);
yCp = plot_lagrange_p(t,y);

if length(P(1,:)) == 3
   z = P(:, 3); %to obtain the 3rd component in 3d curve
   zCp = plot_lagrange_p(t,z);
   figure
   plot3(xCp, yCp, zCp) %plot the 3d curve
   hold on
   grid on
   plot3(x,y,z,'o')
   %axis('equal')
else
    figure 
    plot(xCp, yCp)
    hold on
    grid on
    plot(x,y, 'o')
    axis('equal')
end

end

