function d = distancePoints(p, q)
%calculate the distance between two points
    if length(p) ~= length(q)
       disp('error: dimension of the two points must be the same');
       return
    end
    sum = 0;
    for i=1:length(p)
        sum = sum + (p(i)-q(i))^2;
    end
    d = sqrt(sum);
end