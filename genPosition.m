%%% function for generate position
function[positions] = genPosition(S,F)

%%% pre allocate memory
positions = zeros(S.colVecPos, S.nStimuli);
positions(:,1) = sign(rand(1,S.colVecPos)-0.5);

for i = 2:S.nStimuli
    toChange = rand(S.colVecPos,1) > F.o;
    positions(:,i) = positions(:,i-1);
    positions(toChange,i) = sign(rand(sum(toChange),1)-0.5);
end

end

