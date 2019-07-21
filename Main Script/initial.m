%%%% This function applies IM to each component and computes the level of Structural damage
% DE= Damages in Electric power system        CE= Check in Electric power system
% DW= Damages in Water systems                CW= Check in Water
% DH= Damages in Homes                        CH= Check in Homes
% DR= Damages in Retailers                    CR= Check in Retailers
% DB= Damages in Bridges                      CB= Check in Bridges

function [DE,CE,DW,CW,DH,CH,DR,CR,DB,CB]= initial(nrand)
InputAddress = fullfile('Input','GilroyHazard.mat');
load(InputAddress)
%nrand=10;

Rfrg=rand(nrand,size(Elec,1));    % Generate Random Numbers
%% ELECTRIC POWER SYSTEM
format short
EPf=zeros(3,size(Elec,1));
for i=1:size(Elec,1) 
% Frg(2,:) is frg of towers.     Elec(:,7) is MPGA.
if i<17
EPf(:,i)=logncdf(Elec(i,7),log(Frg(2,[1 5 7])),Frg(2,[2 6 8]))'; % Electrical Tower Pf,  3 Damage States
elseif i==17
 EPf(:,i)=logncdf(Elec(i,7),log(Frg(1,[1 5 7])),Frg(1,[2 6 8]))'; % Substation Pf,  3 Damage States
else 
    EPf(:,i)=logncdf(Elec(i,7),log(Frg(3,[1 5 7])),Frg(3,[2 6 8]))'; % Power Poles Pf,  3 Damage States
end    % end if

end   % end for

% Damage Electricity
DE =   (repmat(EPf(1,:),[nrand,1])<Rfrg) .* 0 +...
       (repmat(EPf(2,:),[nrand,1])<Rfrg) .* (repmat(EPf(1,:),[nrand,1])>=Rfrg).*1 + ...
       (repmat(EPf(3,:),[nrand,1])<Rfrg) .* (repmat(EPf(2,:),[nrand,1])>=Rfrg).* 2 +...
       (repmat(EPf(3,:),[nrand,1])>Rfrg) .*  3   ;
% Check Electricity   0=Fail  1=Functional
CE=(repmat(EPf(1,:),[nrand,1])<Rfrg) .* 1;

%% Water Systems
for i=[1:3 6:9]               % Water Tanks are from 6 to 9 in Water matrix
 % Frg(4,:) is frg of Water Tanks,  Frg(5,:)=Wells.     Water(i,9) is MPGA.
if i<4
WPf(:,i)=logncdf(Water(i,9),log(Frg(5,1:2:7)),Frg(5,2:2:8))'; %  Pf Wells; 4 Damage States
else 
WPf(:,i)=logncdf(Water(i,9),log(Frg(4,1:2:7)),Frg(4,2:2:8))'; %  Pf Water Tanks; 4 Damage States
end    % end if
end    % end for
WPf(:,4:5)=[];

Rfrg=rand(nrand,size(WPf,2));        % Generate Random Numbers

% Damage Water Tanks & Wells
DW =   (repmat(WPf(1,:),[nrand,1])<Rfrg) .* 0 +...
       (repmat(WPf(2,:),[nrand,1])<Rfrg) .* (repmat(WPf(1,:),[nrand,1])>=Rfrg).*1 + ...
       (repmat(WPf(3,:),[nrand,1])<Rfrg) .* (repmat(WPf(2,:),[nrand,1])>=Rfrg).* 2 +...
       (repmat(WPf(4,:),[nrand,1])<Rfrg) .* (repmat(WPf(3,:),[nrand,1])>=Rfrg).* 3 +...
       (repmat(WPf(4,:),[nrand,1])>Rfrg) .*  4   ;
% Check WTs   0=Fail  1=Functional
CW=(repmat(WPf(2,:),[nrand,1])<Rfrg) .* 1;   % Consider 2nd D.S. as threshold

%% Residentials
HPf=zeros(4,size(Res,1));
for i=1:size(Res,1)
                              %     Res(i,7) is MPGA.
HPf(:,i)=logncdf(Res(i,7),log(Res(i,10:2:16)),Res(i,11:2:17))'; %  Pf 
end
Rfrg=rand(nrand,size(Res,1));        % Generate Random Numbers

% Damage Homes
DH =   (repmat(HPf(1,:),[nrand,1])<Rfrg) .* 0 +...
       (repmat(HPf(2,:),[nrand,1])<Rfrg) .* (repmat(HPf(1,:),[nrand,1])>=Rfrg).*1 + ...
       (repmat(HPf(3,:),[nrand,1])<Rfrg) .* (repmat(HPf(2,:),[nrand,1])>=Rfrg).* 2 +...
       (repmat(HPf(4,:),[nrand,1])<Rfrg) .* (repmat(HPf(3,:),[nrand,1])>=Rfrg).* 3 +...
       (repmat(HPf(4,:),[nrand,1])>Rfrg) .*  4   ;
% Check Homes   0=Fail  1=Functional
CH=(repmat(HPf(1,:),[nrand,1])<Rfrg) .* 1;

%% Retailers
RPf=zeros(4,size(Retailer,1));
for i=1:size(Retailer,1)
                                 %     Retailer(i,6) is MPGA.
RPf(:,i)=logncdf(Retailer(i,6),log(Retailer(i,9:2:15)),Retailer(i,10:2:16))'; %  Pf 
end
Rfrg=rand(nrand,size(Retailer,1));        % Generate Random Numbers

% Damage Retailers
DR =   (repmat(RPf(1,:),[nrand,1])<Rfrg) .* 0 +...
       (repmat(RPf(2,:),[nrand,1])<Rfrg) .* (repmat(RPf(1,:),[nrand,1])>=Rfrg).*1 + ...
       (repmat(RPf(3,:),[nrand,1])<Rfrg) .* (repmat(RPf(2,:),[nrand,1])>=Rfrg).* 2 +...
       (repmat(RPf(4,:),[nrand,1])<Rfrg) .* (repmat(RPf(3,:),[nrand,1])>=Rfrg).* 3 +...
       (repmat(RPf(4,:),[nrand,1])>Rfrg) .*  4   ;
% Check Homes   0=Fail  1=Functional
CR=(repmat(RPf(1,:),[nrand,1])<Rfrg) .* 1;

%% Bridges

BPf=zeros(4,size(Bridges,1));
for i=1:size(Bridges,1)
                                 %     Bridges(i,6) is MPGA.
BPf(:,i)=logncdf(Bridges(i,6),log(Bridges(i,10:2:16)),Bridges(i,11:2:17))'; %  Pf 
end

Rfrg=rand(nrand,size(Bridges,1));        % Generate Random Numbers

% Damage Bridges
DB =   (repmat(BPf(1,:),[nrand,1])<Rfrg) .* 0 +...
       (repmat(BPf(2,:),[nrand,1])<Rfrg) .* (repmat(BPf(1,:),[nrand,1])>=Rfrg).*1 + ...
       (repmat(BPf(3,:),[nrand,1])<Rfrg) .* (repmat(BPf(2,:),[nrand,1])>=Rfrg).* 2 +...
       (repmat(BPf(4,:),[nrand,1])<Rfrg) .* (repmat(BPf(3,:),[nrand,1])>=Rfrg).* 3 +...
       (repmat(BPf(4,:),[nrand,1])>Rfrg) .*  4   ;
% Check Bridges   0=Fail  1=Functional
CB=(repmat(BPf(1,:),[nrand,1])<Rfrg) .* 1;



end      % end function
