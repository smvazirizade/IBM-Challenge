%This function will give rewards (no. of people based on toploigy-hardcoded)
%Note that hard coding is imp. since it takes too much of time for a general
%code to find paths and nodes and return reward. For large sacle
%simualtions-millions of calls it's highly inefficient.

function [a,b,r,c]=genrewards(realst)
r=0;
a=0;
b=0;
c=0; br3=0; br4=0; br5=0; br6=0; br7=0; br8=0; br9=0; br10=0; br11=0; br12=0; br13=0; br14=0; br15=0;
br16=0; br17=0; br18=0; br19=0; br20=0; br21=0; br22=0; br23=0; br24=0; br25=0; br26=0; br27=0; br28=0; br29=0;
br30=0; br31=0; br32=0; br33=0; br34=0; br35=0; br36=0; br37=0; br38=0; br39=0; br40=0; br41=0; br42=0;

if (isequal(realst(20:22),ones(1,3)))
    r=r+176; br3=1;
    if(br3==1)%branch 3 has power
        if(isequal(realst(23:35),ones(1,length(realst(23:35)))))%check if branch 4 has power
            r=r+1806;br4=1;
            if(br4==1)%branch 4 has power
                if(isequal(realst(36:44),ones(1,length(realst(36:44)))))%check if branch 5 has power
                    r=r+272;
                end
            end
        end
    end
end

if (isequal(realst(202:207),ones(1,length(realst(202:207)))))%check if branch 26 has power
    r=r+435;br26=1;
    if br26 == 1;
        if (isequal(realst(208:211),ones(1,length(realst(208:211)))))%check if branch 27 has power
            r=r+73;br27=1;
            if br27 == 1;
                if (isequal(realst(212:224),ones(1,length(realst(212:224))))) %check if branch 28 has power
                    r=r+116;
                end
            end
        end
    end
end

if (isequal(realst(313:321),ones(1,length(realst(313:321)))))%check if branch 41 has power, brnach 40 is redundant
    r=r+130; br41=1;
    if br41==1
        if (isequal(realst(202:207),ones(1,length(realst(202:207)))))%check if branch 42 has power-2 instances so 87
            r=r+87;
        end
    end
end

if(br3==1 && (isequal(realst(45:52),ones(1,length(realst(45:52))))))%branch6
    br6=1; r=r+3363;
end

if (br6==1 &&(isequal(realst(225:231),ones(1,length(realst(225:231))))))%branch29
    br29=1; r=r+3236;
end

if (br29==1 &&(isequal(realst(232:239),ones(1,length(realst(232:239))))))%branch 30
    br30=1; r=r+2720;
end

if (br30==1 &&(isequal(realst(240:245),ones(1,length(realst(240:245))))))%branch 31
    r=r+115;
end

if(br6==1 &&(isequal(realst(53:57),ones(1,length(realst(53:57))))))%branch 7
    br7=1; %no reward-branching
end

if (br7==1 &&(isequal(realst(111:115),ones(1,length(realst(111:115))))))%branch 17
    r=r+2641; br17=1;
end

if (br17==1 &&(isequal(realst(131:148),ones(1,length(realst(131:148))))))%branch 20
    r=r+4316;br20=1;
end

if (br20==1 &&(isequal(realst(149:159),ones(1,length(realst(149:159))))))%branch 21
    r=r+3108;br21=1;
end

if (br21==1 &&(isequal(realst(160:170),ones(1,length(realst(160:170))))))%branch 22
    r=r+911;
end

if (br17==1 &&(isequal(realst(116:124),ones(1,length(realst(116:124))))))%branch 18
    br18=1; %no reward
end

if (br18==1 &&(isequal(realst(125:130),ones(1,length(realst(125:130))))))%branch 19
    r=r+1333;
end

if (br18==1 &&(isequal(realst(171:179),ones(1,length(realst(171:179))))))%branch 23
    r=r+1725;br23=1;
end

if (br23==1 &&(isequal(realst(180:185),ones(1,length(realst(180:185))))))%branch 24
    r=r+2816;br24=1;
end

if (br24==1 &&(isequal(realst(186:201),ones(1,length(realst(186:201))))))%branch 25
    r=r+842;
end

if (br7==1 &&(isequal(realst(58:63),ones(1,length(realst(58:63))))))%branch 8
    r=r+2725; br8=1;
end

if (br8==1 &&(isequal(realst(246:255),ones(1,length(realst(246:255))))))%branch 32
    r=r+2720;br32=1;
end

if (br32==1 &&(isequal(realst(256:261),ones(1,length(realst(256:261))))))%branch 33
    r=r+1340;
end

if (br8==1 &&(isequal(realst(64:68),ones(1,length(realst(64:68))))))%branch 9
    br9=1; %no reward only branching
end


if (br9==1 &&(isequal(realst(262:271),ones(1,length(realst(262:271))))))%branch 34
    r=r+1647;br34=1;
end

if (br34==1 &&(isequal(realst(272:275),ones(1,length(realst(272:275))))))%branch 35
    r=r+65;
end

if (br9==1 &&(isequal(realst(69:73),ones(1,length(realst(69:73))))))%branch 10
    r=r+4390;br10=1;
end

if (br10==1 &&(isequal(realst(64:68),ones(1,length(realst(64:68))))))%branch 11
    br11=1; %no reward only branching
end

if (br11==1 &&(isequal(realst(276:285),ones(1,length(realst(276:285))))))%branch 36
    r=r+689;br36=1;
end

if (br36==1 &&(isequal(realst(286:289),ones(1,length(realst(286:289))))))%branch 37
    r=r+407;br37=1;
end

if (br37==1 &&(isequal(realst(290:302),ones(1,length(realst(290:302))))))%branch 38
    r=r+99;br38=1;
end

if (br38==1 &&(isequal(realst(303:312),ones(1,length(realst(303:312))))))%branch 39
    r=r+1324;
end

if (br11==1 &&(isequal(realst(79:83),ones(1,length(realst(79:83))))))%branch 12
    r=r+1039;br12=1;
end

if (br12==1 &&(isequal(realst(84:91),ones(1,length(realst(84:91))))))%branch 13
    r=r+21;br13=1;
end

if (br13==1 &&(isequal(realst(92:99),ones(1,length(realst(92:99))))))%branch 14
    r=r+64;br14=1;
end

if (br14==1 &&(isequal(realst(100:105),ones(1,length(realst(100:105))))))%branch 15
    r=r+166;br15=1;
end

if (br15==1 &&(isequal(realst(106:110),ones(1,length(realst(106:110))))))%branch 16
    r=r+988;
end


end%function end
