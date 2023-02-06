%%%euclidean distance%%%
function eucl = dist(x,y)
eucl = sqrt(sum((x-y).^ 2));
end