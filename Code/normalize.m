function [x,y]=normalize(x,y)

D=size(x,2);

for i = 1:(D)
        x(:, i) = ( x(:, i)-min(x(:, i))) / (max(x(:, i)) - min(x(:, i)));
end
   % y = ( y-min(y) ) / (max(y) - min(y));

end