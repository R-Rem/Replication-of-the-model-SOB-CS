clear all;
close all;


%%% fixed parameter
S.colVecItem = 16;
S.colVecPos = 16;
S.nStimuli = 7;

%%% free parameter
F.trial = 1000;
% overlap between positions
F.o = 0.5;
% activation peak
F.alpha = 3;
% activation slope
F.gamma = 0.8;
% distinctiveness at retrieval
F.c = 1.3;
% output interference
F.OI = 1.5;

M.gradient = F.alpha * F.gamma .^ ((1:S.nStimuli) - 1);

score = zeros(2,S.nStimuli);

for i = 1:2
    % similarity between items
    F.s = [0.35 0.5];
    F.s = F.s(i);
    
    for j = 1:F.trial
        
        %%% generate similar/dissimilar vector with the prototype
        M.item = genDissimilar(S,F);
        
        %%% generate position vector
        M.positions = genPosition(S,F);
        
        %%% encoding
        M.wij = encoding(S,M);
        
        %%% retrieval
        M.output(j,:) = retrieval(S,M,F);
        
    end
    
    %%% calculate the score
    allSscore = 1:S.nStimuli == M.output;
    score(i,:) = mean(allSscore);
    
end

%%% plot
fig = plot(1:S.nStimuli,score(1,:),1:S.nStimuli,score(2,:));
legend(fig,{'dissimilar','similar',})
xlabel('Serial Position'), ylabel('Proportion Correct'),ylim([0 1])