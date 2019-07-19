%This function generates arms at each iteration based on the current state
%of the world based on the network serialization and topology.
function arms=genarms(Realst)
set1=0;
set2=0;
set3=0;
current=[];
current1=[];%for branch 1 and 
current2=[];%for branch 2
current3=[];%for branch 3
k=4; %default size of workers!

%branch1
if (~isequal(Realst(1,20:22),ones(1,size(Realst(20:22),2)))&& set1==0)
    col=find(~Realst(20:22));
    for i=1:length(col)
        dum=20+col(i)-1;
        current1=horzcat(dum,current1);
    end
    set1=1;
end


%Increase pool
if size(current1,2)<k
    set1=0;
end

%branch1
if ((~isequal(Realst(1,23:35),ones(1,size(Realst(23:35),2)))||~isequal(Realst(1,45:52),ones(1,size(Realst(45:52),2))))&&set1==0)
    col=find(~Realst(23:35));
    for i=1:length(col)
        dum=23+col(i)-1;
        current1=horzcat(dum,current1);
    end
    col=find(~Realst(45:52));
    for i=1:length(col)
        dum=45+col(i)-1;
        current1=horzcat(dum,current1);
    end
    set1=1;
end

%Increase pool
if size(current1,2)<k
    set1=0;
end


%branch1
if ((~isequal(Realst(1,36:44),ones(1,size(Realst(36:44),2)))||~isequal(Realst(1,225:231),ones(1,size(Realst(225:231),2)))||~isequal(Realst(1,53:57),ones(1,size(Realst(53:57),2))))&&set1==0)
    col=find(~Realst(36:44));
    for i=1:length(col)
        dum=36+col(i)-1;
        current1=horzcat(dum,current1);
    end
    col=find(~Realst(225:231));
    for i=1:length(col)
        dum=225+col(i)-1;
        current1=horzcat(dum,current1);
    end
    col=find(~Realst(53:57));
    for i=1:length(col)
        dum=53+col(i)-1;
        current1=horzcat(dum,current1);
    end
    set1=1;
end

%Increase pool
if size(current1,2)<k
    set1=0;
end


%only branch1
if ((~isequal(Realst(1,232:239),ones(1,size(Realst(232:239),2)))||~isequal(Realst(1,58:63),ones(1,size(Realst(58:63),2)))||~isequal(Realst(1,111:115),ones(1,size(Realst(111:115),2))))&&set1==0)
    col=find(~Realst(232:239));
    for i=1:length(col)
        dum=232+col(i)-1;
        current1=horzcat(dum,current1);
    end
    col=find(~Realst(58:63));
    for i=1:length(col)
        dum=58+col(i)-1;
        current1=horzcat(dum,current1);
    end
    col=find(~Realst(111:115));
    for i=1:length(col)
        dum=111+col(i)-1;
        current1=horzcat(dum,current1);
    end
    set1=1;
end

%Increase pool
if size(current1,2)<k
    set1=0;
end

%only branch1
if ((~isequal(Realst(1,240:245),ones(1,size(Realst(240:245),2)))||~isequal(Realst(1,246:255),ones(1,size(Realst(246:255),2)))||~isequal(Realst(1,64:68),ones(1,size(Realst(64:68),2)))||~isequal(Realst(1,131:148),ones(1,size(Realst(131:148),2)))||~isequal(Realst(1,116:124),ones(1,size(Realst(116:124),2))))&&set1==0)
    col=find(~Realst(240:245));
    for i=1:length(col)
        dum=240+col(i)-1;
        current1=horzcat(dum,current1);
    end
    col=find(~Realst(246:255));
    for i=1:length(col)
        dum=246+col(i)-1;
        current1=horzcat(dum,current1);
    end
    col=find(~Realst(64:68));
    for i=1:length(col)
        dum=64+col(i)-1;
        current1=horzcat(dum,current1);
    end
    col=find(~Realst(131:148));
    for i=1:length(col)
        dum=131+col(i)-1;
        current1=horzcat(dum,current1);
    end
    col=find(~Realst(116:124));
    for i=1:length(col)
        dum=116+col(i)-1;
        current1=horzcat(dum,current1);
    end
    set1=1;
end

%Increase pool
if size(current1,2)<k
    set1=0;
end

%only branch1
if ((~isequal(Realst(1,256:261),ones(1,size(Realst(256:261),2)))||~isequal(Realst(1,262:271),ones(1,size(Realst(262:271),2)))||~isequal(Realst(1,69:73),ones(1,size(Realst(69:73),2)))||~isequal(Realst(1,149:159),ones(1,size(Realst(149:159),2)))||~isequal(Realst(1,171:179),ones(1,size(Realst(171:179),2)))||~isequal(Realst(1,125:130),ones(1,size(Realst(125:130),2))))&&set1==0)
    col=find(~Realst(256:261));
    for i=1:length(col)
        dum=256+col(i)-1;
        current1=horzcat(dum,current1);
    end
    col=find(~Realst(262:271));
    for i=1:length(col)
        dum=262+col(i)-1;
        current1=horzcat(dum,current1);
    end
    col=find(~Realst(69:73));
    for i=1:length(col)
        dum=69+col(i)-1;
        current1=horzcat(dum,current1);
    end
    col=find(~Realst(149:159));
    for i=1:length(col)
        dum=149+col(i)-1;
        current1=horzcat(dum,current1);
    end
    col=find(~Realst(171:179));
    for i=1:length(col)
        dum=171+col(i)-1;
        current1=horzcat(dum,current1);
    end
    col=find(~Realst(125:130));
    for i=1:length(col)
        dum=125+col(i)-1;
        current1=horzcat(dum,current1);
    end
    set1=1;
end

%Increase pool
if size(current1,2)<k
    set1=0;
end

%only branch1
if ((~isequal(Realst(1,272:275),ones(1,size(Realst(272:275),2)))||~isequal(Realst(1,74:78),ones(1,size(Realst(74:78),2)))||~isequal(Realst(1,160:170),ones(1,size(Realst(160:170),2)))||~isequal(Realst(1,180:185),ones(1,size(Realst(180:185),2))))&&set1==0)
    col=find(~Realst(272:275));
    for i=1:length(col)
        dum=272+col(i)-1;
        current1=horzcat(dum,current1);
    end
    col=find(~Realst(74:78));
    for i=1:length(col)
        dum=74+col(i)-1;
        current1=horzcat(dum,current1);
    end
    col=find(~Realst(160:170));
    for i=1:length(col)
        dum=160+col(i)-1;
        current1=horzcat(dum,current1);
    end
    col=find(~Realst(180:185));
    for i=1:length(col)
        dum=180+col(i)-1;
        current1=horzcat(dum,current1);
    end
    set1=1;
end

%Increase pool
if size(current1,2)<k
    set1=0;
end

%only branch1
if ((~isequal(Realst(1,79:83),ones(1,size(Realst(79:83),2)))||~isequal(Realst(1,276:285),ones(1,size(Realst(276:285),2)))||~isequal(Realst(1,186:201),ones(1,size(Realst(186:201),2))))&&set1==0)
    col=find(~Realst(79:83));
    for i=1:length(col)
        dum=79+col(i)-1;
        current1=horzcat(dum,current1);
    end
    col=find(~Realst(276:285));
    for i=1:length(col)
        dum=276+col(i)-1;
        current1=horzcat(dum,current1);
    end
    col=find(~Realst(186:201));
    for i=1:length(col)
        dum=186+col(i)-1;
        current1=horzcat(dum,current1);
    end
    set1=1;
end

%Increase pool
if size(current1,2)<k
    set1=0;
end

%only branch1
if ((~isequal(Realst(1,84:91),ones(1,size(Realst(84:91),2)))||~isequal(Realst(1,286:289),ones(1,size(Realst(286:289),2))))&&set1==0)
    col=find(~Realst(84:91));
    for i=1:length(col)
        dum=84+col(i)-1;
        current1=horzcat(dum,current1);
    end
    col=find(~Realst(286:289));
    for i=1:length(col)
        dum=286+col(i)-1;
        current1=horzcat(dum,current1);
    end
    set1=1;
end

%Increase pool
if size(current1,2)<k
    set1=0;
end

%only branch1
if ((~isequal(Realst(1,92:99),ones(1,size(Realst(92:99),2)))||~isequal(Realst(1,290:302),ones(1,size(Realst(290:302),2))))&&set1==0)
    col=find(~Realst(92:99));
    for i=1:length(col)
        dum=92+col(i)-1;
        current1=horzcat(dum,current1);
    end
    col=find(~Realst(290:302));
    for i=1:length(col)
        dum=290+col(i)-1;
        current1=horzcat(dum,current1);
    end
    set1=1;
end

%Increase pool
if size(current1,2)<k
    set1=0;
end

%only branch1
if ((~isequal(Realst(1,100:105),ones(1,size(Realst(100:105),2)))||~isequal(Realst(1,303:312),ones(1,size(Realst(303:312),2))))&&set1==0)
    col=find(~Realst(100:105));
    for i=1:length(col)
        dum=100+col(i)-1;
        current1=horzcat(dum,current1);
    end
    col=find(~Realst(303:312));
    for i=1:length(col)
        dum=303+col(i)-1;
        current1=horzcat(dum,current1);
    end
    set1=1;
end

%Increase pool
if size(current1,2)<k
    set1=0;
end

%only branch1
if (~isequal(Realst(1,106:110),ones(1,size(Realst(106:110),2)))&& set1==0)
    col=find(~Realst(106:110));
    for i=1:length(col)
        dum=106+col(i)-1;
        current1=horzcat(dum,current1);
    end
    set1=1;
end



%branch2
if (~isequal(Realst(1,202:207),ones(1,size(Realst(202:207),2)))&& set2==0)
    col=find(~Realst(202:207));
    for i=1:length(col)
        dum=202+col(i)-1;
        current2=horzcat(dum,current2);
    end
    set2=1;
end

%Increase pool
if size(current2,2)<k
    set2=0;
end


%branch2
if (~isequal(Realst(1,208:211),ones(1,size(Realst(208:211),2)))&& set2==0)
    col=find(~Realst(208:211));
    for i=1:length(col)
        dum=208+col(i)-1;
        current2=horzcat(dum,current2);
    end
    set2=1;
end


%Increase pool
if size(current2,2)<k
    set2=0;
end


%branch2
if ((~isequal(Realst(1,212:224),ones(1,size(Realst(212:224),2))))&& set2==0)
    col=find(~Realst(212:224));
    for i=1:length(col)
        dum=212+col(i)-1;
        current2=horzcat(dum,current2);
    end
    set2=1;
end



%branch3
if (~isequal(Realst(1,313:321),ones(1,size(Realst(313:321),2)))&& set3==0)
    col=find(~Realst(313:321));
    for i=1:length(col)
        dum=313+col(i)-1;
        current3=horzcat(dum,current3);
    end
    set3=1;
end

%Increase pool
if size(current3,2)<k
    set3=0;
end


%branch3
if (~isequal(Realst(1,322:327),ones(1,size(Realst(322:327),2)))&& set3==0)
    col=find(~Realst(322:327));
    for i=1:length(col)
        dum=322+col(i)-1;
        current3=horzcat(dum,current3);
    end
    set3=1;
end


current=horzcat(current1,current2,current3);


if size(current,2)<k && size(current,2)~=0 %if less than num wrks location are remaining damaged
    k=size(current,2);
end

arms=nchoosek(current,k);

end