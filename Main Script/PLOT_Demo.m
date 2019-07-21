% 7.16.2019
% Here we plot the recovery process trajectories
clc; clear; close all
InputAddress = fullfile('Output','ResultDemo.mat');
load(InputAddress)


Range=[0:.01:40];
figure
colormap winter
for i=1:length(Results)  % For each simulated recovery path
    RP=0;
    Data=0;
    %read each recovery path
    RP=Results{i};
    % In each Recovery Path data frame, the 1st column is the number people
    % benefited from RPN recovery and the 2nd is the repair time, the
    % cumulative sum repesnets the time from the beginnning of the
    % recovery.
    %stairs(cumsum(RP(:,2)),RP(:,1))
    Data=[cumsum(RP(:,2)),RP(:,1)];
    %Data(end,:)=[Range(end),47905];
    stairs(Data(:,1),Data(:,2),'Color', [0.5 0.5 0.5])
    DataInterp(:,i) = interp1(Data(:,1),Data(:,2),Range,'previous');
%     DataInterp(sum(~isnan(DataInterp))+1:end)=max(Data);
    DataInterp(isnan(DataInterp))=max(Data(:,2));
    hold on
    xlabel('Time (Days)')
    ylabel('Number of People with Electricity')
end
colormap winter


Mean=mean(DataInterp,2);
SD=std(DataInterp,1,2);
stairs(Range,Mean,'k','LineWidth',1.5)
stairs(Range,Mean+SD,'r','LineWidth',1.5)
stairs(Range,Mean-SD,'r','LineWidth',1.5)

figure
for i=1:length(Results)  % For each simulated recovery path
    stairs(Range,DataInterp(:,i))
    hold on
    xlabel('Time (Days)')
    ylabel('Number of People with Electricity')
end


