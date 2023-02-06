%%% function cosine similarity
function Cs = cosSim(x,y)
Cs = dot(x, y) / (sqrt(sum(x.^2)) .*  sqrt(sum(y.^2)));
end