%%% function for generate dissimilar or similar vector with prototype
function[genList] = genDissimilar(S,F)

%%% create a prototype vector
prototype = sign(rand(1,S.colVecItem)-0.5);

genList = repmat(prototype,S.nStimuli,1);
toChange = rand(S.nStimuli,S.colVecItem) > sqrt(F.s);
genList(toChange) = sign(rand(1,sum(toChange,'all'))-0.5);

end