%Load Network

clc; clear all; close all;

%% Load and cleaning adjacency matrix
InputAddress = fullfile('Input','adj42.mat');
load(InputAddress);                    % Load Adjacency Matrix .mat that models Electical power network topology
adj=adj42; clear adj42;            %Change the name to adj
adj(1,:)=[];adj(:,1)=[];           % Delete the heads & rows' names (41x41)


%% Generate hazard scenarios drops
rng(6)
nrand=10^3;      % Number of hazard scenarios
% Find the initial conidtion of the community in each network, here we just
% work with EPN: DE and CE. DE shows the level damage in each componenet,
% CE: shows it is functional or not.
[DE,CE,DW,CW,DH,CH,DR,CR,DB,CB]= initial(nrand); 

%Network is loaded and earthquake has occured.
%Main Decision making and plotting code.
%i for each hazard scenario increase it till nrand to decrease the dispersion in the recovery process
for i=1:1 
   
    time=0;%time for deciding one scenario
    pullno=0;%total no of pulls in one scenario
    % Generate Random Repair Time for each scenario
    RTimeSub=[(exprnd(1,[1 1]))   (exprnd(3,[1 1]))   (exprnd(7,[1 1]))    (exprnd(30,[1 1]))];
    RTimeT=  [(exprnd(.5,[16 1]))  (exprnd(1,[16 1]))  (exprnd(1,[16 1]))   (exprnd(2,[16 1]))];
    RTimeP=  [(exprnd(.5,[310 1])) (exprnd(1,[310 1])) (exprnd(1,[310 1]))  (exprnd(1,[310 1]))];
    %rng(6)
    RTime=[RTimeT;RTimeSub;RTimeP];
    %Construct map of decision making: Not necessary, do it on the fly with a
    %function-genarm.
    
    %Begin decision making
    Realst=CE(i,:);
    Realst(1,1:19)=ones(1,19);%assumption that everything till component number 19 is fixed after damage! If not someone is alreday working on fixing it
    
    %Extract Repair time based on the level of damage
    NRTime=zeros(1,327);
    dum1=find(~Realst);
    dum2=DE(i,find(~Realst));
    for count=1:length(dum1)
        NRTime(1,dum1(count))=RTime(dum1(count),dum2(count));
    end
    RTime=NRTime;
    %genreward tells us how much reward we gain by repairing each
    %component
    [~,~,intEPPL,~] = genrewards(Realst);
    %initial number of people unaffected after disaster EPPL contain
    %everything we need during the process
    count2=1;
    EPPL(count2,1)=intEPPL;%people affected
    EPPL(count2,2)=0;%time from begining
    EPPL(count2,3)=0;%Numworkers
    EPPL(count2,4:8)=0;%Locations where repair work was carried out
    EPPL(count2,9)=0;%Component which got repaired
    %Numwork=3; Determined by arm list to account for diminishing locations
    tic
    % Doing repair until the end of recovery that the whole EPN is restored
    while(~isequal(Realst,ones(1,size(Realst,2)))) %1 in CE is functional 0 is non functional
        arms=genarms(Realst);
        pullno=pullno+size(arms,1);
        Qval=zeros(size(arms,1),1);

        %ROLLOUT begins
        % Try all possible actions (arms) in each time slot, do it
        % parallelly
        parfor armcount=1:size(arms,1)
            dummyst=Realst;
            DRTime=RTime;
            cuarm=arms(armcount,:);
            count=1;
            rew=0;
            rtraj=zeros(370,2);
            rtraj(count,2)=min(DRTime(1,cuarm));%later this time gets erased %reward trajectory time to decide Q value
            DRTime(1,cuarm)=DRTime(1,cuarm)-min(DRTime(1,cuarm));
            dummyst(1,find(~DRTime))=1;
            [~,~,rew,~] = genrewards(dummyst);
            rtraj(count,1)=rew;%actual reward in reward trajectory
            
            %Rollout for each (action)arm till the end, rollout the base
            %policy at the end choose the best possible action in each time
            %slot
            while(~isequal(dummyst,ones(1,size(dummyst,2))))
                count=count+1;%follow base policy until the end
                temp=find(~dummyst);
                temp=sort(temp);%base policy!
                if size(temp,2)<4
                    Numwork=size(temp,2);
                else
                    Numwork=4; 
                end
                rtraj(count,2)=min(DRTime(1,temp(1:Numwork)));
                DRTime(1,temp(1:Numwork))=DRTime(1,temp(1:Numwork))-min(DRTime(1,temp(1:Numwork)));
                dummyst(1,find(~DRTime))=1;
                [~,~,rew,~] = genrewards(dummyst);
                rtraj(count,1)=rew;
            end %end of one trajectory of one arm
            %calculating Qval (the value of each action) for one arm
            rtraj(count+1:end,:)=[];
            Qval(armcount,1)=trapz(cumsum(rtraj(:,2)),rtraj(:,1))/sum(rtraj(:,2));
        end

        [~,I]=max(Qval);
        cuarm=arms(I,:);
        count2=count2+1;
        EPPL(count2,2)=min(RTime(1,cuarm));
        [~,IZ]=min(RTime(1,cuarm));
        cuarm(IZ);
        RTime(1,cuarm)=RTime(1,cuarm)-min(RTime(1,cuarm));
        Realst(1,find(~RTime))=1;
        [~,~,intEPPL,~] = genrewards(Realst);
        EPPL(count2,1)=intEPPL;
        EPPL(count2,3)=size(cuarm,2);
        EPPL(count2,4:3+EPPL(count2,3))=cuarm;
        EPPL(count2,9)=cuarm(IZ);
    end
    i
    toc;
    time=time+toc;
    Results{i}=EPPL;
    Times{i}=time;
    Pullnos{i}=pullno;
    clear EPPL;
end

%save Result.mat We deactivated it to not change our demo results go to the
%plot to see the final results