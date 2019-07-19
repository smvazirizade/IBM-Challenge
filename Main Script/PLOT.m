% 7.16.2019
% Here we plot the recovery process trajectories
clc; clear
load Result

for i=1:length(Results)  % For each simulated recovery path
    %read each recovery path
    RP=Results{i};
    % In each Recovery Path data frame, the 1st column is the number people
    % benefited from RPN recovery and the 2nd is the repair time, the
    % cumulative sum repesnets the time from the beginnning of the
    % recovery.
    stairs(cumsum(RP(:,2)),RP(:,1))
    hold on
end