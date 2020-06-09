clear;clc;

%% Parameters
%-----------------------------------------------------------------------
addpath('R:\code\toolboxes\spm12')

%% simulate Task timing
[names,onsets,durations] = simulatedTask();

%% Design
defineFmriDesignBatch(names,onsets,durations);

%% Calculation of the efficiency

%contrast of interest:
c=[-1 1 0]; 

DesignEfficiency = calculateDesignEfficiency(pwd,c);
disp(['Efficiency is:']); disp(DesignEfficiency);

%% im SPM:
% click on review and load the SPM.mat file. Now check the design matrix,
% design orthogonality, and the frequency distribution of the regressors.





