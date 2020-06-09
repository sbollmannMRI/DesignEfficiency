function [] = defineFmriDesignBatch (names,onsets,durations)


spm('defaults','fmri');
spm_jobman('initcfg');
clear jobs

delete([pwd,filesep,'SPM.mat']);

matlabbatch{1}.spm.stats.fmri_design.dir = {pwd};
matlabbatch{1}.spm.stats.fmri_design.timing.units = 'scans';
matlabbatch{1}.spm.stats.fmri_design.timing.RT = 1.925;
matlabbatch{1}.spm.stats.fmri_design.timing.fmri_t = 16;
matlabbatch{1}.spm.stats.fmri_design.timing.fmri_t0 = 1;
% matlabbatch{1}.spm.stats.fmri_design.sess.nscan = 571;
matlabbatch{1}.spm.stats.fmri_design.sess.nscan = 400;

matlabbatch{1}.spm.stats.fmri_design.sess.cond = struct('name', names,...
    'onset', onsets, 'duration', durations);
% , 'tmod', {}, 'pmod', {}
matlabbatch{1}.spm.stats.fmri_design.sess.multi = {''};

matlabbatch{1}.spm.stats.fmri_design.sess.regress = struct('name', {},...
    'val', {});

matlabbatch{1}.spm.stats.fmri_design.sess.multi_reg = {''};
matlabbatch{1}.spm.stats.fmri_design.sess.hpf = 128;

matlabbatch{1}.spm.stats.fmri_design.fact = struct('name', {}, 'levels',...
    {});

matlabbatch{1}.spm.stats.fmri_design.bases.hrf.derivs = [0 0];
matlabbatch{1}.spm.stats.fmri_design.volt = 1;
matlabbatch{1}.spm.stats.fmri_design.global = 'None';
matlabbatch{1}.spm.stats.fmri_design.cvi = 'AR(1)';


spm_jobman('run',matlabbatch);