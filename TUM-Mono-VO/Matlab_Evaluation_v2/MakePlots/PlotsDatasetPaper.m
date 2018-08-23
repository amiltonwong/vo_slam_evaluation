
%% Benchmark Paper: Figure 8. Evaluation Result:
[ MallErrorsAlign, MallErrorsR, MallErrorsS, MallErrorsRMSE, MallErrorsA, MallErrorsE, Mn] = getSortedLOOPError( DSO_LOOP_FWD, [0:9] +1, DSO_LOOP_BWD );
[ OallErrorsAlign, OallErrorsR, OallErrorsS, OallErrorsRMSE, OallErrorsA, OallErrorsE, On] = getSortedLOOPError( ORB_LOOP_FWD, [0:9] +1, ORB_LOOP_BWD );

[ MallErrorsAlign_RT, MallErrorsR_RT, MallErrorsS_RT, MallErrorsRMSE_RT, MallErrorsA_RT, MallErrorsE_RT, Mn_RT] = getSortedLOOPError( DSO_LOOP_RT, [0:9] + 1 );
[ OallErrorsAlign_RT, OallErrorsR_RT, OallErrorsS_RT, OallErrorsRMSE_RT, OallErrorsA_RT, OallErrorsE_RT, On_RT] = getSortedLOOPError( ORB_LOOP_RTFIX, [0:9] +1 );


clf

subplot(1,3,1)
hold on
semilogx(MallErrorsAlign,500*(1:Mn)/Mn,'blue','LineWidth',2)
semilogx(MallErrorsAlign_RT,500*(1:Mn_RT)/Mn_RT,'blue','LineWidth',2,'LineStyle','--')
semilogx(OallErrorsAlign,500*(1:On)/On,'red','LineWidth',2)
semilogx(OallErrorsAlign_RT,500*(1:On_RT)/On_RT,'red','LineWidth',2,'LineStyle','--')
axis([0 10 0 500]);
grid on
set(gca, 'XTick',[0:2:10])
title('alignment error')


subplot(1,3,2)
hold on
semilogx(MallErrorsR,500*(1:Mn)/Mn,'blue','LineWidth',2)
semilogx(MallErrorsR_RT,500*(1:Mn_RT)/Mn_RT,'blue','LineWidth',2,'LineStyle','--')
semilogx(OallErrorsR,500*(1:On)/On,'red','LineWidth',2)
semilogx(OallErrorsR_RT,500*(1:On_RT)/On_RT,'red','LineWidth',2,'LineStyle','--')
axis([0 20 0 500]);
grid on
set(gca, 'XTick',[0:4:20])
title('rotation error')


subplot(1,3,3)
hold on
semilogx(MallErrorsS,500*(1:Mn)/Mn,'blue','LineWidth',2)
semilogx(MallErrorsS_RT,500*(1:Mn_RT)/Mn_RT,'blue','LineWidth',2,'LineStyle','--')
semilogx(OallErrorsS,500*(1:On)/On,'red','LineWidth',2)
semilogx(OallErrorsS_RT,500*(1:On_RT)/On_RT,'red','LineWidth',2,'LineStyle','--')
legend('DSO', 'DSO (real-time)', 'ORB-SLAM', 'ORB-SLAM (real-time)','Location','southeast')
axis([1 4 0 500]);
grid on

set(gca, 'XTick',[1:0.5:4])
title('translation error')

%% Benchmark Paper: Figure 12. Start- and End-Segment Error:
[ MallErrorsAlign, MallErrorsR, MallErrorsS, MallErrorsRMSE, MallErrorsA, MallErrorsE, Mn] = getSortedLOOPError( DSO_LOOP_FWD, [0:9] +1 );
[ OallErrorsAlign, OallErrorsR, OallErrorsS, OallErrorsRMSE, OallErrorsA, OallErrorsE, On] = getSortedLOOPError( ORB_LOOP_FWD, [0:9] +1 );



subplot(1,2,1)
hold on
semilogx(MallErrorsA,500*(1:Mn)/Mn,'blue','LineWidth',2)
semilogx(OallErrorsA,500*(1:On)/On,'red','LineWidth',2)
%legend('DSO', 'ORB-SLAM','Location','southeast')
axis([0 0.1 0 500]);
grid on
set(gca, 'XTick',[0:0.02:0.1])
title('start segment error')


subplot(1,2,2)
hold on
semilogx(MallErrorsE,500*(1:Mn)/Mn,'blue','LineWidth',2)
semilogx(OallErrorsE,500*(1:On)/On,'red','LineWidth',2)
legend('DSO', 'ORB-SLAM','Location','southeast')
axis([0 0.1 0 500]);
grid on
set(gca, 'XTick',[0:0.02:0.1])
title('end segment error')


%% Benchmark Paper: Figure 9. Different Field of View:
[ MallErrorsAlign, MallErrorsR, MallErrorsS, MallErrorsRMSE, ~, ~,Mn] = getSortedLOOPError( DSO_LOOP_FWD, [0:9] +1, DSO_LOOP_BWD );
[ OallErrorsAlign, OallErrorsR, OallErrorsS, OallErrorsRMSE, ~, ~,On] = getSortedLOOPError( ORB_LOOP_FWD, [0:9] +1, ORB_LOOP_BWD );

[ MallErrorsAlign300, MallErrorsR300, MallErrorsS300, MallErrorsRMSE300, ~, ~,Mn300] = getSortedLOOPError( DSO_LOOP_FWD, [10:14] +1, DSO_LOOP_BWD );
[ OallErrorsAlign300, OallErrorsR300, OallErrorsS300, OallErrorsRMSE300, ~, ~,On300] = getSortedLOOPError( ORB_LOOP_FWD, [20:24] +1, ORB_LOOP_BWD );


[ MallErrorsAlign400, MallErrorsR400, MallErrorsS400, MallErrorsRMSE400, ~, ~,Mn400] = getSortedLOOPError( DSO_LOOP_FWD, [15:19] +1, DSO_LOOP_BWD );
[ OallErrorsAlign400, OallErrorsR400, OallErrorsS400, OallErrorsRMSE400, ~, ~,On400] = getSortedLOOPError( ORB_LOOP_FWD, [25:29] +1, ORB_LOOP_BWD );


[ MallErrorsAlign500, MallErrorsR500, MallErrorsS500, MallErrorsRMSE500, ~, ~,Mn500] = getSortedLOOPError( DSO_LOOP_FWD, [20:24] +1, DSO_LOOP_BWD );
[ OallErrorsAlign500, OallErrorsR500, OallErrorsS500, OallErrorsRMSE500, ~, ~, On500] = getSortedLOOPError( ORB_LOOP_FWD, [30:34] +1, ORB_LOOP_BWD );


clf
hold on
steps=1:2:14;

plot(MallErrorsAlign,   1000+500*(1:Mn)/Mn,'blue','LineWidth',2,'LineStyle','-', 'Marker','o')
plot(MallErrorsAlign300,1000+500*(1:Mn300)/Mn300,'blue','LineWidth',1,'LineStyle','-', 'Marker','+')
plot(MallErrorsAlign400,1000+500*(1:Mn400)/Mn400,'blue','LineWidth',1,'LineStyle','-', 'Marker','v')
plot(MallErrorsAlign500,1000+500*(1:Mn500)/Mn500,'blue','LineWidth',1,'LineStyle','-', 'Marker','*')
plot(OallErrorsAlign,   1000+500*(1:On)/On,'red','LineWidth',2,'LineStyle','-', 'Marker','o')
plot(OallErrorsAlign300,1000+500*(1:On300)/On300,'red','LineWidth',1,'LineStyle','-', 'Marker','+')
plot(OallErrorsAlign400,1000+500*(1:On400)/On400,'red','LineWidth',1,'LineStyle','-', 'Marker','v')
plot(OallErrorsAlign500,1000+500*(1:On500)/On500,'red','LineWidth',1,'LineStyle','-', 'Marker','*')


plot(MallErrorsAlign,500*(1:Mn)/Mn,'blue','LineWidth',2,'LineStyle','-')
plot(MallErrorsAlign300,500*(1:Mn300)/Mn300,'blue','LineWidth',1,'LineStyle','-')
plot(MallErrorsAlign400,500*(1:Mn400)/Mn400,'blue','LineWidth',1,'LineStyle','-')
plot(MallErrorsAlign500,500*(1:Mn500)/Mn500,'blue','LineWidth',1,'LineStyle','-')
plot(OallErrorsAlign,500*(1:On)/On,'red','LineWidth',2,'LineStyle','-')
plot(OallErrorsAlign300,500*(1:On300)/On300,'red','LineWidth',1,'LineStyle','-')
plot(OallErrorsAlign400,500*(1:On400)/On400,'red','LineWidth',1,'LineStyle','-')
plot(OallErrorsAlign500,500*(1:On500)/On500,'red','LineWidth',1,'LineStyle','-')


plot(steps,findXVec(500*(1:Mn)/Mn, MallErrorsAlign,steps),'blue','LineWidth',2,'LineStyle','none', 'Marker','o')
plot(steps,findXVec(500*(1:Mn300)/Mn300, MallErrorsAlign300,steps),'blue','LineWidth',1,'LineStyle','none', 'Marker','+')
plot(steps,findXVec(500*(1:Mn400)/Mn400, MallErrorsAlign400,steps),'blue','LineWidth',1,'LineStyle','none', 'Marker','v')
plot(steps,findXVec(500*(1:Mn500)/Mn500, MallErrorsAlign500,steps),'blue','LineWidth',1,'LineStyle','none', 'Marker','*')
plot(steps,findXVec(500*(1:On)/On, OallErrorsAlign,steps),'red','LineWidth',2,'LineStyle','none','Marker','o')
plot(steps,findXVec(500*(1:On300)/On300, OallErrorsAlign300,steps),'red','LineWidth',1,'LineStyle','none', 'Marker','+')
plot(steps,findXVec(500*(1:On400)/On400, OallErrorsAlign400,steps),'red','LineWidth',1,'LineStyle','none', 'Marker','v')
plot(steps,findXVec(500*(1:On500)/On500, OallErrorsAlign500,steps),'red','LineWidth',1,'LineStyle','none', 'Marker','*')





axis([0 10 0 500]);
grid on

set(gca, 'XTick',[0:5:20])
legend( ...
    '102^\circ / 98^\circ (f=min) (DSO)', ...
    '93^\circ (f=300) (DSO)', ...
    '77^\circ (f=400) (DSO)', ...
    '65^\circ (f=500) (DSO)', ...
    '102^\circ / 98^\circ (f=min) (ORB)', ...
    '93^\circ (f=300) (ORB)',  ...
    '77^\circ (f=400) (ORB)',  ...
    '65^\circ (f=500) (ORB)',  ...
    'Location','NorthEastOutside')


%%  Benchmark Paper: Figure 10. Different Image Resolution:

[ MallErrorsAlign, MallErrorsR, MallErrorsS, MallErrorsRMSE, ~, ~,Mn] = getSortedLOOPError( DSO_LOOP_FWD, [0:9] +1, DSO_LOOP_BWD );
[ OallErrorsAlign, OallErrorsR, OallErrorsS, OallErrorsRMSE, ~, ~,On] = getSortedLOOPError( ORB_LOOP_FWD, [0:9] +1, ORB_LOOP_BWD );

[ MallErrorsAlignlowlowRes, MallErrorsRlowlowRes, MallErrorsSlowlowRes, MallErrorsRMSElowlowRes, ~, ~,MnlowlowRes] = getSortedLOOPError( DSO_LOOP_FWD, [290:294] +1, DSO_LOOP_BWD );
[ OallErrorsAlignlowlowRes, OallErrorsRlowlowRes, OallErrorsSlowlowRes, OallErrorsRMSElowlowRes, ~, ~,OnlowlowRes] = getSortedLOOPError( ORB_LOOP_FWD, [45:49] +1, ORB_LOOP_BWD );

[ MallErrorsAlignlowRes, MallErrorsRlowRes, MallErrorsSlowRes, MallErrorsRMSElowRes, ~, ~,MnlowRes] = getSortedLOOPError( DSO_LOOP_FWD, [30:34] +1, DSO_LOOP_BWD );
[ OallErrorsAlignlowRes, OallErrorsRlowRes, OallErrorsSlowRes, OallErrorsRMSElowRes, ~, ~,OnlowRes] = getSortedLOOPError( ORB_LOOP_FWD, [40:44] +1, ORB_LOOP_BWD );

[ MallErrorsAlignhighRes, MallErrorsRhighRes, MallErrorsShighRes, MallErrorsRMSEhighRes, ~, ~,MnhighRes] = getSortedLOOPError( DSO_LOOP_FWD, [25:29] +1, DSO_LOOP_BWD );
[ OallErrorsAlignhighRes, OallErrorsRhighRes, OallErrorsShighRes, OallErrorsRMSEhighRes, ~, ~,OnhighRes] = getSortedLOOPError( ORB_LOOP_FWD, [35:39] +1, ORB_LOOP_BWD );




steps=1:2:14;
clf
hold on

plot(MallErrorsAlign,           1000+500*(1:Mn)/Mn,'blue','LineWidth',2,'LineStyle','-', 'Marker','o')
plot(MallErrorsAlignlowlowRes,  1000+500*(1:MnlowlowRes)/MnlowlowRes,'blue','LineWidth',1,'LineStyle','-', 'Marker','v')
plot(MallErrorsAlignlowRes,     1000+500*(1:MnlowRes)/MnlowRes,'blue','LineWidth',1,'LineStyle','-', 'Marker','+')
plot(MallErrorsAlignhighRes,    1000+500*(1:MnhighRes)/MnhighRes,'blue','LineWidth',1,'LineStyle','-', 'Marker','*')
plot(OallErrorsAlign,           1000+500*(1:On)/On,'red','LineWidth',2,'LineStyle','-', 'Marker','o')
plot(OallErrorsAlignlowlowRes,  1000+500*(1:OnlowlowRes)/OnlowlowRes,'red','LineWidth',1,'LineStyle','-', 'Marker','v')
plot(OallErrorsAlignlowRes,     1000+500*(1:OnlowRes)/OnlowRes,'red','LineWidth',1,'LineStyle','-', 'Marker','+')
plot(OallErrorsAlignhighRes,    1000+500*(1:OnhighRes)/OnhighRes,'red','LineWidth',1,'LineStyle','-', 'Marker','*')


plot(MallErrorsAlign,               500*(1:Mn)/Mn,          'blue','LineWidth',2,'LineStyle','-')
plot(MallErrorsAlignlowlowRes,     500*(1:MnlowlowRes)/MnlowlowRes,'blue','LineWidth',1,'LineStyle','-')
plot(MallErrorsAlignlowRes,         500*(1:MnlowRes)/MnlowRes,'blue','LineWidth',1,'LineStyle','-')
plot(MallErrorsAlignhighRes,        500*(1:MnhighRes)/MnhighRes,'blue','LineWidth',1,'LineStyle','-')
plot(OallErrorsAlign,               500*(1:On)/On,          'red','LineWidth',2,'LineStyle','-')
plot(OallErrorsAlignlowlowRes,     500*(1:OnlowlowRes)/OnlowlowRes,'red','LineWidth',1,'LineStyle','-')
plot(OallErrorsAlignlowRes,         500*(1:OnlowRes)/OnlowRes,'red','LineWidth',1,'LineStyle','-')
plot(OallErrorsAlignhighRes,        500*(1:OnhighRes)/OnhighRes,'red','LineWidth',1,'LineStyle','-')


plot(steps,findXVec(500*(1:Mn)/Mn, MallErrorsAlign,steps),'blue','LineWidth',2,'LineStyle','none', 'Marker','o')
plot(steps,findXVec(500*(1:MnlowlowRes)/MnlowlowRes, MallErrorsAlignlowlowRes,steps),'blue','LineWidth',1,'LineStyle','none', 'Marker','v')
plot(steps,findXVec(500*(1:MnlowRes)/MnlowRes, MallErrorsAlignlowRes,steps),'blue','LineWidth',1,'LineStyle','none', 'Marker','+')
plot(steps,findXVec(500*(1:MnhighRes)/MnhighRes, MallErrorsAlignhighRes,steps),'blue','LineWidth',1,'LineStyle','none', 'Marker','*')
plot(steps,findXVec(500*(1:On)/On, OallErrorsAlign,steps),'red','LineWidth',2,'LineStyle','none','Marker','o')
plot(steps,findXVec(500*(1:OnlowlowRes)/OnlowlowRes, OallErrorsAlignlowlowRes,steps),'red','LineWidth',1,'LineStyle','none', 'Marker','v')
plot(steps,findXVec(500*(1:OnlowRes)/OnlowRes, OallErrorsAlignlowRes,steps),'red','LineWidth',1,'LineStyle','none', 'Marker','+')
plot(steps,findXVec(500*(1:OnhighRes)/OnhighRes, OallErrorsAlignhighRes,steps),'red','LineWidth',1,'LineStyle','none', 'Marker','*')


axis([0 10 0 500]);
grid on

set(gca, 'XTick',[0:5:20])
legend( ...
    '640x480 (DSO)', ...
    '320x240 (DSO)', ...
    '424x320 (DSO)', ...
    '960x720 (DSO)', ...
    '640x480 (ORB)', ...
    '320x240 (ORB)', ...
    '424x320 (ORB)',  ...
    '960x720 (ORB)',  ...
    'Location','NorthEastOutside')


%% Dataset Paper: Figure 11. Dataset Motion Bias: 

[ MallErrorsAlign, MallErrorsR, MallErrorsS, MallErrorsRMSE, ~, ~,Mn] = getSortedLOOPError( DSO_LOOP_FWD, [0:9] + 1);
[ OallErrorsAlign, OallErrorsR, OallErrorsS, OallErrorsRMSE, ~, ~,On] = getSortedLOOPError( ORB_LOOP_FWD, [0:9] + 1);

[ MallErrorsAlignBack, MallErrorsRBack, MallErrorsSBack, MallErrorsRMSEBack, ~, ~,MnBack] = getSortedLOOPError( DSO_LOOP_BWD, [0:9] + 1 );
[ OallErrorsAlignBack, OallErrorsRBack, OallErrorsSBack, OallErrorsRMSEBack, ~, ~,OnBack] = getSortedLOOPError( ORB_LOOP_BWD, [0:9] + 1 );


[ MallErrorsAlignCombi, MallErrorsRCombi, MallErrorsSCombi, MallErrorsRMSECombi, ~, ~,MnCombi] = getSortedLOOPError( DSO_LOOP_FWD, [0:9] + 1, DSO_LOOP_BWD );
[ OallErrorsAlignCombi, OallErrorsRCombi, OallErrorsSCombi, OallErrorsRMSECombi, ~, ~,OnCombi] = getSortedLOOPError( ORB_LOOP_FWD, [0:9] + 1, ORB_LOOP_BWD );


steps=1:2:14;
clf
hold on

plot(MallErrorsAlignCombi,  1000+500*(1:MnCombi)/MnCombi,'blue','LineWidth',2,'LineStyle','-', 'Marker','o')
plot(MallErrorsAlign,       1000+500*(1:Mn)/Mn,'blue','LineWidth',1,'LineStyle','-', 'Marker','+')
plot(MallErrorsAlignBack,   1000+500*(1:MnBack)/MnBack,'blue','LineWidth',1,'LineStyle','-', 'Marker','v')
plot(OallErrorsAlignCombi,  1000+500*(1:OnCombi)/OnCombi,'red','LineWidth',2,'LineStyle','-', 'Marker','o')
plot(OallErrorsAlign,       1000+500*(1:On)/On,'red','LineWidth',1,'LineStyle','-', 'Marker','+')
plot(OallErrorsAlignBack,   1000+500*(1:OnBack)/OnBack,'red','LineWidth',1,'LineStyle','-', 'Marker','v')


plot(MallErrorsAlignCombi,  500*(1:MnCombi)/MnCombi,'blue','LineWidth',2,'LineStyle','-')
plot(MallErrorsAlign,       500*(1:Mn)/Mn,          'blue','LineWidth',1,'LineStyle','-')
plot(MallErrorsAlignBack,   500*(1:MnBack)/MnBack,'blue','LineWidth',1,'LineStyle','-')
plot(OallErrorsAlignCombi,  500*(1:OnCombi)/OnCombi,'red','LineWidth',2,'LineStyle','-')
plot(OallErrorsAlign,       500*(1:On)/On,          'red','LineWidth',1,'LineStyle','-')
plot(OallErrorsAlignBack,   500*(1:OnBack)/OnBack,'red','LineWidth',1,'LineStyle','-')


plot(steps,findXVec(500*(1:MnCombi)/MnCombi, MallErrorsAlignCombi,steps),'blue','LineWidth',2,'LineStyle','none', 'Marker','o')
plot(steps,findXVec(500*(1:Mn)/Mn, MallErrorsAlign,steps),'blue','LineWidth',1,'LineStyle','none', 'Marker','+')
plot(steps,findXVec(500*(1:MnBack)/MnBack, MallErrorsAlignBack,steps),'blue','LineWidth',1,'LineStyle','none', 'Marker','v')

plot(steps,findXVec(500*(1:OnCombi)/OnCombi, OallErrorsAlignCombi,steps),'red','LineWidth',2,'LineStyle','none', 'Marker','o')
plot(steps,findXVec(500*(1:On)/On, OallErrorsAlign,steps),'red','LineWidth',1,'LineStyle','none','Marker','+')
plot(steps,findXVec(500*(1:OnBack)/OnBack, OallErrorsAlignBack,steps),'red','LineWidth',1,'LineStyle','none', 'Marker','v')


axis([0 10 0 500]);
grid on

set(gca, 'XTick',[0:5:20])
legend( ...
    'Fwd+Bwd (DSO)', ...
    'Fwd only (DSO)', ...
    'Bwd only (DSO)', ...
    'Fwd+Bwd (ORB)', ...
    'Fwd only (ORB)',  ...
    'Bwd only (ORB)',  ...
    'Location','NorthEastOutside')
