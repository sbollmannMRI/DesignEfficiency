function [names,onsets,durations] = simulatedTask()

% this function models our working memory task
trialsPerLoadLevel = 40;
TR=1.925;
fixationTimeInScans= 3.5/TR;
StimulusTimeInScans= 0.8/TR;
retentionShortTimeInScans=2/TR;
retentionLongTimeInScans=4/TR;

totalTimeInScans=0;

for n=1:trialsPerLoadLevel
    preRentionTimeInScans=fixationTimeInScans+StimulusTimeInScans;
    
    totalTimeInScans=totalTimeInScans+preRentionTimeInScans;
    
    onsets{1}(n)=totalTimeInScans;
    
    retrievalTime=(1.7*rand(1,1)+0.3)/TR;
    totalTimeInScans=totalTimeInScans+...
        retentionShortTimeInScans+retrievalTime;
    durations{1}(n)=retentionShortTimeInScans+retrievalTime;
    
    totalTimeInScans=totalTimeInScans+preRentionTimeInScans;
    
    retrievalTime=(1.7*rand(1,1)+0.3)/TR;
    onsets{2}(n)=totalTimeInScans;
    totalTimeInScans=totalTimeInScans+...
        retentionLongTimeInScans+retrievalTime;
    durations{2}(n)=retentionLongTimeInScans+retrievalTime;
end

names{1}='retentionLow';
names{2}='retentionHigh';
