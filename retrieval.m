%%% retrieval
function output = retrieval(S,M,F)

s = zeros(1,S.nStimuli);
output = zeros (1,S.nStimuli);

for i = 1:S.nStimuli
    
    v = M.positions(:,i)'*M.wij;
    for j = 1:S.nStimuli
        D = dist(v,M.item(j,:));
        s(j) = exp(-F.c*D);
    end
    
    % Luce's choice rule
    p = s/sum(s);
    [~, idx] = max(p);
    output(i) = idx;
    
    % response suppression - with the one item that has been selected
    M.wij = (M.wij - M.positions(:,i)*M.item(idx,:));    
    
    % now we add noise to the system to model output interference
    M.wij = M.wij + randn(size(M.wij)) * F.OI;
    
end

end
