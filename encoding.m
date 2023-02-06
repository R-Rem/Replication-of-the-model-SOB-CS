%%% encoding
function [wij] =  encoding(S,M)

wij = zeros(S.colVecPos, S.colVecItem);

for i = 1:S.nStimuli
    wij = wij + (1+M.gradient(i)) * (M.positions(:,i)*M.item(i,:));
end

end