function DesignEfficiency = calculateDesignEfficiency (pathToSPMfile,c)
% This function calcuates the Design Efficiency of a Model
%  input:
%      path to SPM.mat file
%      contrast vector c
%  output:
%       DesignEfficiency

load ([pathToSPMfile,filesep,'SPM.mat']);
X = SPM.xX.X;

%     check orientation of c
if size(c,2)==1
    c=c';
end

varEtaHat = c*inv(X'*X)*c';

DesignEfficiency = 1/varEtaHat;

end