

%% DSO Paper: Figure 11. Results on TUM monoVO dataset. 
clf
[ MallErrorsAlign, MallErrorsR, MallErrorsS, MallErrorsRMSE, MallErrorsA, MallErrorsE, Mn] = getSortedLOOPError( DSO_LOOP_FWD, [0:9] +1, DSO_LOOP_BWD );
[ OallErrorsAlign, OallErrorsR, OallErrorsS, OallErrorsRMSE, OallErrorsA, OallErrorsE, On] = getSortedLOOPError( ORB_LOOP_FWD, [0:9] +1, ORB_LOOP_BWD );

[ MallErrorsAlign_RT, MallErrorsR_RT, MallErrorsS_RT, MallErrorsRMSE_RT, MallErrorsA_RT, MallErrorsE_RT, Mn_RT] = getSortedLOOPError( DSO_LOOP_RT, [0:9] + 1 );
[ OallErrorsAlign_RT, OallErrorsR_RT, OallErrorsS_RT, OallErrorsRMSE_RT, OallErrorsA_RT, OallErrorsE_RT, On_RT] = getSortedLOOPError( ORB_LOOP_RTFIX, [0:9] +1 );

[ MallErrorsAlign_RT2, MallErrorsR_RT2, MallErrorsS_RT2, MallErrorsRMSE_RT2, MallErrorsA_RT2, MallErrorsE_RT2, Mn_RT2] = getSortedLOOPError( DSO_LOOP_RT, [10:19]+1 );


steps=1:1:10;


subplot(1,3,1)
hold on
semilogx(MallErrorsAlign,500*(1:Mn)/Mn,'blue','LineWidth',2)
semilogx(MallErrorsAlign_RT,500*(1:Mn_RT)/Mn_RT,'blue','LineWidth',2,'LineStyle','--')
semilogx(MallErrorsAlign_RT2,500*(1:Mn_RT2)/Mn_RT2,'blue','LineWidth',1,'LineStyle','-')
plot(steps,findXVec(500*(1:Mn_RT2)/Mn_RT2, MallErrorsAlign_RT2,steps),'blue','LineWidth',1,'LineStyle','none', 'Marker','o')
semilogx(OallErrorsAlign,500*(1:On)/On,'red','LineWidth',2)
semilogx(OallErrorsAlign_RT,500*(1:On_RT)/On_RT,'red','LineWidth',2,'LineStyle','--')
axis([0 10 0 500]);
grid on
set(gca, 'XTick',[0:2:10])
title('alignment error')



subplot(1,3,2)
steps=1:2:20;

hold on
semilogx(MallErrorsR,500*(1:Mn)/Mn,'blue','LineWidth',2)
semilogx(MallErrorsR_RT,500*(1:Mn_RT)/Mn_RT,'blue','LineWidth',2,'LineStyle','--')
semilogx(MallErrorsR_RT2,500*(1:Mn_RT2)/Mn_RT2,'blue','LineWidth',1,'LineStyle','-')
plot(steps,findXVec(500*(1:Mn_RT2)/Mn_RT2, MallErrorsR_RT2,steps),'blue','LineWidth',1,'LineStyle','none', 'Marker','o')

semilogx(OallErrorsR,500*(1:On)/On,'red','LineWidth',2)
semilogx(OallErrorsR_RT,500*(1:On_RT)/On_RT,'red','LineWidth',2,'LineStyle','--')
axis([0 20 0 500]);
grid on
set(gca, 'XTick',[0:4:20])

title('rotation error')






subplot(1,3,3)
steps=1:0.5:4;
hold on
semilogx(MallErrorsS,500*(1:Mn)/Mn,'blue','LineWidth',2)
semilogx(MallErrorsS_RT,500*(1:Mn_RT)/Mn_RT,'blue','LineWidth',2,'LineStyle','--')
semilogx(MallErrorsS_RT2,5000+500*(1:Mn_RT2)/Mn_RT2,'blue','LineWidth',1,'LineStyle','-', 'Marker','o')

semilogx(OallErrorsS,500*(1:On)/On,'red','LineWidth',2)
semilogx(OallErrorsS_RT,500*(1:On_RT)/On_RT,'red','LineWidth',2,'LineStyle','--')


semilogx(MallErrorsS_RT2,500*(1:Mn_RT2)/Mn_RT2,'blue','LineWidth',1,'LineStyle','-')
plot(steps,findXVec(500*(1:Mn_RT2)/Mn_RT2, MallErrorsS_RT2,steps),'blue','LineWidth',1,'LineStyle','none', 'Marker','o')



legend('DSO', 'DSO (real-time)', 'DSO (LQ, 5x real-time)', 'ORB-SLAM', 'ORB-SLAM (real-time)','Location','southeast')
axis([1 4 0 500]);
grid on

set(gca, 'XTick',[1:0.5:4])
title('scale error')



%% DSO: Figure 14. Photometric Calibration.
clf 

idx_default = 0:9;          % default.
idx_allFix = 50:54;       % no exposure correction whatsoever, AB FIX
idx_noABPrior = 45:49;      % full correction, no prior on AB (unknown exposure)
idx_noVignette = 40:44;     % no vignette correction, no prior on AB
idx_nogamma = 35:39;        % no vignette & no gamma correction, no prior on AB
idx_Cfix = 255:259;       % full correction, AB FIX
idx_Cmfix = 260:264;       % full correction, AB MOSTLY FIX


[ err_default, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_default + 1, DSO_LOOP_BWD );
n_default = size(err_default,1);

[ err_noABPrior, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_noABPrior + 1, DSO_LOOP_BWD  );
n_noABPrior = size(err_noABPrior,1);


[ err_noVignette, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_noVignette + 1, DSO_LOOP_BWD  );
n_noVignette = size(err_noVignette,1);


[ err_nogamma, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_nogamma + 1, DSO_LOOP_BWD  );
n_nogamma = size(err_nogamma,1);


[ err_allFix, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_allFix + 1, DSO_LOOP_BWD  );
n_allFix = size(err_allFix,1);


[ err_Cfix, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_Cfix + 1 , DSO_LOOP_BWD );
n_Cfix = size(err_Cfix,1);


[ err_Cmfix, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_Cmfix + 1, DSO_LOOP_BWD  );
n_Cmfix = size(err_Cmfix,1);


clf
hold on
plot(err_default,500*(1:n_default)/n_default,'red','LineWidth',2)
plot(err_noABPrior,500*(1:n_noABPrior)/n_noABPrior,'blue','LineWidth',2)
plot(err_noVignette,500*(1:n_noVignette)/n_noVignette,'green','LineWidth',2)
plot(err_nogamma,500*(1:n_nogamma)/n_nogamma,'yellow','LineWidth',2)
plot(err_allFix,500*(1:n_allFix)/n_allFix,'black','LineWidth',2)

axis([0 10 0 500]);
grid on

legend('full calib.', 'unknown t', 'unknown t, V', 'unknown t, V, G', 'brightness cons.','Location','eastoutside');
set(gca, 'XTick',[0:1:10])



%% DSO: Figure 15. Amount of Data Used. 
clf

idx_50 =  275:279;
idx_100 =  270:274;
idx_200 =  265:269;
idx_300 =  205:209;
idx_500 =  200:204;
idx_700 =  195:199;
idx_1000 =  55:59;
idx_1500 =  60:64;
idx_3000 =  65:69;
idx_6000 =  70:74;
idx_10000 = 75:79;

idx_kf4 = 280:284;
idx_kf5 = 80:84;
idx_kf6 = 185:189;
idx_kf9 = 85:89;
idx_kf11 = 190:194;
idx_fixWindow = 285:289;

[ err_default, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_default + 1, DSO_LOOP_BWD);
n_default = size(err_default,1);

[ err_50, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_50 + 1, DSO_LOOP_BWD );
n_50 = size(err_50,1);

[ err_100, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_100 + 1, DSO_LOOP_BWD );
n_100 = size(err_100,1);

[ err_200, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_200 + 1, DSO_LOOP_BWD );
n_200 = size(err_200,1);

[ err_300, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_300 + 1, DSO_LOOP_BWD );
n_300 = size(err_300,1);

[ err_500, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_500 + 1, DSO_LOOP_BWD );
n_500 = size(err_500,1);

[ err_700, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_700 + 1, DSO_LOOP_BWD );
n_700 = size(err_700,1);

[ err_1000, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_1000 + 1, DSO_LOOP_BWD );
n_1000 = size(err_1000,1);


[ err_1500, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_1500 + 1, DSO_LOOP_BWD );
n_1500 = size(err_1500,1);

[ err_3000, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_3000 + 1, DSO_LOOP_BWD );
n_3000 = size(err_3000,1);

[ err_6000, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_6000 + 1, DSO_LOOP_BWD );
n_6000 = size(err_6000,1);

[ err_10000, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_10000 + 1, DSO_LOOP_BWD );
n_10000 = size(err_10000,1);

[ err_kf4, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_kf4 + 1, DSO_LOOP_BWD );
n_kf4 = size(err_kf4,1);

[ err_kf5, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_kf5 + 1, DSO_LOOP_BWD );
n_kf5 = size(err_kf5,1);

[ err_kf6, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_kf6 + 1, DSO_LOOP_BWD );
n_kf6 = size(err_kf6,1);

[ err_kf9, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_kf9 + 1, DSO_LOOP_BWD );
n_kf9 = size(err_kf9,1);

[ err_kf11, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_kf11 + 1, DSO_LOOP_BWD );
n_kf11 = size(err_kf11,1);

[ err_fixWindow, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_fixWindow + 1, DSO_LOOP_BWD );
n_fixWindow = size(err_fixWindow,1);



 subplot(1,2,1)
C = jet(8); C=C(end:-1:1,:);
hold on
semilogx(err_50,500*(1:n_50)/n_50,'Color',C(1,:)','LineWidth',2)
semilogx(err_100,500*(1:n_100)/n_100,'Color',C(2,:)','LineWidth',2)
semilogx(err_200,500*(1:n_200)/n_200,'Color',C(3,:)','LineWidth',2)
semilogx(err_500,500*(1:n_500)/n_500,'Color',C(4,:)','LineWidth',2)
semilogx(err_1000,500*(1:n_1000)/n_1000,'Color',C(5,:)','LineWidth',2)
semilogx(err_default,500*(1:n_default)/n_default,'Color',C(6,:)','LineWidth',2)
semilogx(err_6000,500*(1:n_6000)/n_6000,'Color',C(7,:)','LineWidth',2)
semilogx(err_10000,500*(1:n_10000)/n_10000,'Color',C(8,:)','LineWidth',2)
axis([0 10 0 500]);
grid on
legend('N_p=50', 'N_p=100', 'N_p=200', 'N_p=500', 'N_p=1000', 'N_p=2000', 'N_p=6000', 'N_p=10000','Location','eastoutside');
set(gca, 'XTick',[0:1:10])





subplot(1,2,2)
C = jet(6); C=C(end:-1:1,:);
hold on
semilogx(err_kf4,500*(1:n_kf4)/n_kf4,'Color',C(1,:)','LineWidth',2)
semilogx(err_kf5,500*(1:n_kf5)/n_kf5,'Color',C(2,:)','LineWidth',2)
semilogx(err_kf6,500*(1:n_kf6)/n_kf6,'Color',C(3,:)','LineWidth',2)
semilogx(err_default,500*(1:n_default)/n_default,'Color',C(4,:)','LineWidth',2)
semilogx(err_kf9,500*(1:n_kf9)/n_kf9,'Color',C(5,:)','LineWidth',2)
semilogx(err_kf11,500*(1:n_kf11)/n_kf11,'Color',C(6,:)','LineWidth',2)
semilogx(err_fixWindow,500*(1:n_fixWindow)/n_fixWindow,'Color','black','LineWidth',2,'LineStyle','--')
axis([0 10 0 500]);
grid on
legend('N_f=4', 'N_f=5', 'N_f=6', 'N_f=7', 'N_f=9', 'N_f=11', 'N_f=7, fix-lag','Location','eastoutside');


set(gca, 'XTick',[0:1:10])







%% Figure 16. Selection of Data Used.
clf

idx_default = 0:9;
idx_W20 = 215:219;
idx_W15 = 210:214;
idx_W10 = 90:94;
idx_W5 = 95:99;
idx_W3 = 100:104;
idx_W2 = 220:224;
idx_W1 = 225:229;
idx_W0 = 230:234;

idx_Fast20 = 105:109;
idx_Fast15 = 110:114;
idx_Fast10 = 115:119;
idx_Fast05 = 120:124;



[ err_default, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_default + 1, DSO_LOOP_BWD );
n_default = size(err_default,1);

[ err_W20, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_W20 + 1, DSO_LOOP_BWD  );
n_W20 = size(err_W20,1);

[ err_W15, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_W15 + 1, DSO_LOOP_BWD  );
n_W15 = size(err_W15,1);

[ err_W10, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_W10 + 1, DSO_LOOP_BWD  );
n_W10 = size(err_W10,1);

[ err_W5, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_W5 + 1, DSO_LOOP_BWD  );
n_W5 = size(err_W5,1);

[ err_W3, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_W3 + 1, DSO_LOOP_BWD  );
n_W3 = size(err_W3,1);

[ err_W2, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_W2 + 1, DSO_LOOP_BWD  );
n_W2 = size(err_W2,1);

[ err_W1, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_W1 + 1, DSO_LOOP_BWD  );
n_W1 = size(err_W1,1);

[ err_W0, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_W0 + 1, DSO_LOOP_BWD  );
n_W0 = size(err_W0,1);




[ err_Fast20, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_Fast20 + 1, DSO_LOOP_BWD  );
n_Fast20 = size(err_Fast20,1);

[ err_Fast15, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_Fast15 + 1, DSO_LOOP_BWD  );
n_Fast15 = size(err_Fast15,1);

[ err_Fast10, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_Fast10 + 1, DSO_LOOP_BWD  );
n_Fast10 = size(err_Fast10,1);

[ err_Fast05, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_Fast05 + 1, DSO_LOOP_BWD  );
n_Fast05 = size(err_Fast05,1);




subplot(1,2,1)

C = jet(5); C=C(end:-1:1,:);
hold on
semilogx(err_W20,500*(1:n_W20)/n_W20,'Color',C(1,:),'LineWidth',2)
semilogx(err_W15,500*(1:n_W15)/n_W15,'Color',C(2,:),'LineWidth',2)
semilogx(err_default,500*(1:n_default)/n_default,'Color',C(3,:),'LineWidth',2)
semilogx(err_W3,500*(1:n_W3)/n_W3,'Color',C(4,:),'LineWidth',2)
semilogx(err_W0,500*(1:n_W0)/n_W0,'Color',C(5,:),'LineWidth',2)

axis([0 10 0 500]);
grid on
legend('g_{th}=20','g_{th}=15', 'g_{th}=7', 'g_{th}=3', 'g_{th}=0','Location','southeast');

set(gca, 'XTick',[0:2:10])


subplot(1,2,2)

C = jet(4); C=C(end:-1:1,:);
hold on
semilogx(err_default,500*(1:n_default)/n_default,'Color','black','LineWidth',1)
semilogx(err_Fast20,500*(1:n_Fast20)/n_Fast20,'Color',C(1,:),'LineWidth',2)
semilogx(err_Fast15,500*(1:n_Fast15)/n_Fast15,'Color',C(2,:),'LineWidth',2)
semilogx(err_Fast10,500*(1:n_Fast10)/n_Fast10,'Color',C(3,:),'LineWidth',2)
semilogx(err_Fast05,500*(1:n_Fast05)/n_Fast05,'Color',C(4,:),'LineWidth',2)

axis([0 10 0 500]);
grid on
legend('g_{th}=7', 'Fast-th=20', 'Fast-th=15', 'Fast-th=10', 'Fast-th=5','Location','southeast');



set(gca, 'XTick',[0:2:10])




%% DSO Figure 17. Number of Keyframes.
clf 


idx_default = 0:9;
idx_More15 = 125:129;
idx_More20 = 130:134;
idx_Less15 = 135:139;
idx_Less20 = 140:144;

idx_Less30 = 235:239;
idx_Less50 = 240:244;
idx_More30 = 245:249;
idx_More50 = 250:254;


[ err_default, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_default + 1, DSO_LOOP_BWD  );
[ nkf_default] = getLOOPKfPerSec( DSO_LOOP_FWD, idx_default + 1, DSO_LOOP_BWD );
n_default = size(err_default,1);

[ err_More15, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_More15 + 1, DSO_LOOP_BWD  );
[ nkf_More15] = getLOOPKfPerSec( DSO_LOOP_FWD, idx_More15 + 1, DSO_LOOP_BWD );
n_More15 = size(err_More15,1);

[ err_More20, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_More20 + 1, DSO_LOOP_BWD  );
[ nkf_More20] = getLOOPKfPerSec( DSO_LOOP_FWD, idx_More20 + 1, DSO_LOOP_BWD );
n_More20 = size(err_More20,1);

[ err_More30, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_More30 + 1, DSO_LOOP_BWD  );
[ nkf_More30] = getLOOPKfPerSec( DSO_LOOP_FWD, idx_More30 + 1, DSO_LOOP_BWD );
n_More30 = size(err_More30,1);

[ err_More50, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_More50 + 1, DSO_LOOP_BWD  );
[ nkf_More50] = getLOOPKfPerSec( DSO_LOOP_FWD, idx_More50 + 1, DSO_LOOP_BWD );
n_More50 = size(err_More50,1);

[ err_Less15, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_Less15 + 1, DSO_LOOP_BWD  );
[ nkf_Less15] = getLOOPKfPerSec( DSO_LOOP_FWD, idx_Less15 + 1, DSO_LOOP_BWD );
n_Less15 = size(err_Less15,1);

[ err_Less20, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_Less20 + 1, DSO_LOOP_BWD  );
[ nkf_Less20] = getLOOPKfPerSec( DSO_LOOP_FWD, idx_Less20 + 1, DSO_LOOP_BWD );
n_Less20 = size(err_Less20,1);

[ err_Less30, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_Less30 + 1, DSO_LOOP_BWD  );
[ nkf_Less30] = getLOOPKfPerSec( DSO_LOOP_FWD, idx_Less30 + 1, DSO_LOOP_BWD );
n_Less30 = size(err_Less30,1);

[ err_Less50, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_Less50 + 1, DSO_LOOP_BWD  );
[ nkf_Less50] = getLOOPKfPerSec( DSO_LOOP_FWD, idx_Less50 + 1, DSO_LOOP_BWD );
n_Less50 = size(err_Less50,1);


C = jet(9);

clf
hold on
semilogx(err_More50,500*(1:n_More50)/n_More50,'Color',C(1,:),'LineWidth',2)
semilogx(err_More30,500*(1:n_More30)/n_More30,'Color',C(2,:),'LineWidth',2)
semilogx(err_More20,500*(1:n_More20)/n_More20,'Color',C(3,:),'LineWidth',2)
%semilogx(err_More15,500*(1:n_More15)/n_More15,'Color',C(4,:),'LineWidth',2)
semilogx(err_default,500*(1:n_default)/n_default,'Color',C(5,:),'LineWidth',2)
%semilogx(err_Less15,500*(1:n_Less15)/n_Less15,'Color',C(6,:),'LineWidth',2)
semilogx(err_Less20,500*(1:n_Less20)/n_Less20,'Color',C(7,:),'LineWidth',2)
semilogx(err_Less30,500*(1:n_Less30)/n_Less30,'Color',C(8,:),'LineWidth',2)
semilogx(err_Less50,500*(1:n_Less50)/n_Less50,'Color',C(9,:),'LineWidth',2)
axis([0 10 0 500]);
grid on
legend(['x5 (\approx ' num2str(nkf_More50,'%.0f') ' KF/s)'], ...
    ['x3 (\approx ' num2str(nkf_More30,'%.0f') ' KF/s)'], ...
     ['x2 (\approx ' num2str(nkf_More20,'%.0f') ' KF/s)'], ...
     ['x1 (\approx ' num2str(nkf_default,'%.1f') ' KF/s)'], ...
     ['x1/2 (\approx ' num2str(nkf_Less20,'%.1f') ' KF/s)'], ...
     ['x1/3 (\approx ' num2str(nkf_Less30,'%.1f') ' KF/s)'], ...
     ['x1/5 (\approx ' num2str(nkf_Less50,'%.1f') ' KF/s)'], ...
    'Location', 'eastoutside');


set(gca, 'XTick',[0:2:10])



%% DSO: Figure 18. Residual Pattern.
clf

idx_default = 0:9;
idx_pat1 = 150:154;
idx_pat3 = 155:159;
idx_pat4 = 160:164;
idx_pat5 = 165:169;
idx_pat7 = 170:174;

idx_pat2 = 295:299;
idx_pat6 = 300:304;
idx_pat9 = 305:309;


[ err_default, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD, idx_default + 1, DSO_LOOP_BWD );
n_default = size(err_default,1);

[ err_pat1, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_pat1 + 1, DSO_LOOP_BWD  );
n_pat1 = size(err_pat1,1);

[ err_pat2, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_pat2 + 1, DSO_LOOP_BWD  );
n_pat2 = size(err_pat2,1);

[ err_pat3, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_pat3 + 1, DSO_LOOP_BWD  );
n_pat3 = size(err_pat3,1);

[ err_pat4, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_pat4 + 1, DSO_LOOP_BWD  );
n_pat4 = size(err_pat4,1);

[ err_pat5, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_pat5 + 1, DSO_LOOP_BWD  );
n_pat5 = size(err_pat5,1);

[ err_pat6, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_pat6 + 1, DSO_LOOP_BWD  );
n_pat6 = size(err_pat6,1);

[ err_pat7, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_pat7 + 1, DSO_LOOP_BWD  );
n_pat7 = size(err_pat7,1);

[ err_pat9, ~, ~, ~] = getSortedLOOPError( DSO_LOOP_FWD,  idx_pat9 + 1, DSO_LOOP_BWD  );
n_pat9 = size(err_pat9,1);



clf
hold on
semilogx(err_pat1,500*(1:n_pat1)/n_pat1,'red','LineWidth',2)
semilogx(err_pat2,500*(1:n_pat2)/n_pat2,'red','LineWidth',2, 'LineStyle','--')
semilogx(err_pat3,500*(1:n_pat3)/n_pat3,'yellow','LineWidth',2)
semilogx(err_pat4,500*(1:n_pat4)/n_pat4,'green','LineWidth',2)
semilogx(err_pat5,500*(1:n_pat5)/n_pat5,'blue','LineWidth',2)
semilogx(err_pat6,500*(1:n_pat6)/n_pat6,'blue','LineWidth',2, 'LineStyle','--')
semilogx(err_pat7,500*(1:n_pat7)/n_pat7,'magenta','LineWidth',2)
semilogx(err_default,500*(1:n_default)/n_default,'black','LineWidth',2)
semilogx(err_pat9,500*(1:n_pat9)/n_pat9,'magenta','LineWidth',2, 'LineStyle','--')


axis([0 10 0 500]);
grid on
%xlabel('t_{align}');
%ylabel('# sequences');
legend('patt. 1', 'patt. 2', 'patt. 3', 'patt. 4', 'patt. 5', 'patt. 6', 'patt. 7','patt. 8','patt. 9', 'Location', 'southeast');

set(gca, 'XTick',[0:2:10])






%% Figure 10. Results on EuRoC MAV and ICL NUIM datasets.
clf

the = 0.8;
steps=0:0.05:0.5;
subplot(1,2,1);

[ orb_rmseLC, orb_nLC] = getSortedMAVError( ORB_MAV_FWD, [1015:1019], the, 1:22, ORB_MAV_BWD );
[ orb_rmseTInf, orb_nTInf] = getSortedMAVError( ORB_MAV_FWD, [1000:1004], the, 1:22, ORB_MAV_BWD );
[ orb_rmseT10, orb_nT10] = getSortedMAVError( ORB_MAV_FWD, [1005:1009], the, 1:22, ORB_MAV_BWD );
[ orb_rmseT1, orb_nT1] = getSortedMAVError( ORB_MAV_FWD, [1010:1014], the, 1:22, ORB_MAV_BWD );
[ OallErrorsAlign_RT, On_RT] = getSortedMAVError( ORB_MAV_RTFIX, [100:109], the, 1:22 );

[ mav_rmse, mav_n] = getSortedMAVError( DSO_MAV_FWD, [0:9], the, 1:22, DSO_MAV_BWD );
[ MallErrorsAlign_RT, Mn_RT] = getSortedMAVError( DSO_MAV_RT, [1000:1009], the, 1:22 );
[ MallErrorsAlign_RT2, Mn_RT2] = getSortedMAVError( DSO_MAV_RT, [1010:1019], the, 1:22 );




hold on
semilogx(mav_rmse,220*(1:mav_n)/mav_n,'blue','LineWidth',2)
semilogx(MallErrorsAlign_RT,220*(1:Mn_RT)/Mn_RT,'blue','LineWidth',2,'LineStyle','--')
semilogx(MallErrorsAlign_RT2,5000+220*(1:Mn_RT2)/Mn_RT2,'blue','LineWidth',1,'LineStyle','-','Marker','o')

semilogx(orb_rmseTInf,220*(1:orb_nTInf)/orb_nTInf,'red','LineWidth',2)
semilogx(OallErrorsAlign_RT,220*(1:On_RT)/On_RT,'red','LineWidth',2,'LineStyle','--')


plot(orb_rmseT10,1000+220*(1:orb_nT10)/orb_nT10,'red','LineWidth',1, 'Marker','o')
plot(orb_rmseT10,220*(1:orb_nT10)/orb_nT10,'red','LineWidth',1)
plot(steps,findXVec(220*(1:orb_nT10)/orb_nT10, orb_rmseT10,steps),'red','LineStyle','none','LineWidth',1, 'Marker','o')

plot(MallErrorsAlign_RT2,220*(1:Mn_RT2)/Mn_RT2,'blue','LineWidth',1)
plot(steps,findXVec(220*(1:Mn_RT2)/Mn_RT2, MallErrorsAlign_RT2,steps),'blue','LineStyle','none','LineWidth',1, 'Marker','o')



legend('DSO', 'DSO (RT)', 'DSO (LQ, 5x RT)', 'ORB', 'ORB (RT)', 'ORB (t_{max}=10s)', 'Location','eastoutside')
axis([0 0.5 0 220]);
grid on

set(gca, 'XTick',[0:0.1:0.5])
title('EuRoC MAV')







the = 0.8;
steps=0:0.025:0.5;
subplot(1,2,2);
[ orb_rmseLC, orb_nLC] = getSortedMAVError( ORB_SIM_FWD, [1015:1019], the, 1:8, ORB_SIM_BWD );
[ orb_rmseTInf, orb_nTInf] = getSortedMAVError( ORB_SIM_FWD, [1000:1004], the, 1:8, ORB_SIM_BWD );
[ orb_rmseT10, orb_nT10] = getSortedMAVError( ORB_SIM_FWD, [1005:1009], the, 1:8, ORB_SIM_BWD );
[ orb_rmseT1, orb_nT1] = getSortedMAVError( ORB_SIM_FWD, [1010:1014], the, 1:8, ORB_SIM_BWD );
[ OallErrorsAlign_RT, On_RT] = getSortedMAVError( ORB_SIM_RTFIX, [100:109], the, 1:8 );

[ mav_rmse, mav_n] = getSortedMAVError( DSO_SIM_FWD, 0:9, the, 1:8, DSO_SIM_BWD );
[ MallErrorsAlign_RT, Mn_RT] = getSortedMAVError( DSO_SIM_RT, [1000:1009], the, 1:8 );
[ MallErrorsAlign_RT2, Mn_RT2] = getSortedMAVError( DSO_SIM_RT, [1010:1019], the, 1:8 );

hold on
semilogx(mav_rmse,80*(1:mav_n)/mav_n,'blue','LineWidth',2)
semilogx(MallErrorsAlign_RT,80*(1:Mn_RT)/Mn_RT,'blue','LineWidth',2,'LineStyle','--')
semilogx(MallErrorsAlign_RT2,5000+80*(1:Mn_RT2)/Mn_RT2,'blue','LineWidth',1,'LineStyle','-','Marker','o')

semilogx(orb_rmseTInf,80*(1:orb_nTInf)/orb_nTInf,'red','LineWidth',2)
semilogx(OallErrorsAlign_RT,80*(1:On_RT)/On_RT,'red','LineWidth',2,'LineStyle','--')


plot(orb_rmseT10,1000+80*(1:orb_nT10)/orb_nT10,'red','LineWidth',1, 'Marker','o')
plot(orb_rmseT10,80*(1:orb_nT10)/orb_nT10,'red','LineWidth',1)
plot(steps,findXVec(80*(1:orb_nT10)/orb_nT10, orb_rmseT10,steps),'red','LineStyle','none','LineWidth',1, 'Marker','o')

plot(MallErrorsAlign_RT2,80*(1:Mn_RT2)/Mn_RT2,'blue','LineWidth',1)
plot(steps,findXVec(80*(1:Mn_RT2)/Mn_RT2, MallErrorsAlign_RT2,steps),'blue','LineStyle','none','LineWidth',1, 'Marker','o')


legend('DSO', 'DSO (RT)', 'DSO (LQ, 5x RT)', 'ORB', 'ORB (RT)', 'ORB (t_{max}=10s)', 'Location','eastoutside')
axis([0 0.2 0 80]);
grid on

set(gca, 'XTick',[0:0.1:0.5])
title('ICL_NUIM')

%% DSO: Figure 19. Geometric Noise.
clf



[ errM_default, ~, ~, ~, ~, ~, nM_default] = getSortedLOOPError( DSO_LOOP_FWD, [0:9] + 1, DSO_LOOP_BWD );
[ errM_geo05, ~, ~, ~, ~, ~, nM_geo05] = getSortedLOOPError( DSO_LOOP_FWD, [315:319] + 1, DSO_LOOP_BWD );
[ errM_geo10, ~, ~, ~, ~, ~, nM_geo10] = getSortedLOOPError( DSO_LOOP_FWD, [320:324] + 1, DSO_LOOP_BWD );
[ errM_geo15, ~, ~, ~, ~, ~, nM_geo15] = getSortedLOOPError( DSO_LOOP_FWD, [325:329] + 1, DSO_LOOP_BWD );
[ errM_geo20, ~, ~, ~, ~, ~, nM_geo20] = getSortedLOOPError( DSO_LOOP_FWD, [330:334] + 1, DSO_LOOP_BWD );
[ errM_geo30, ~, ~, ~, ~, ~, nM_geo30] = getSortedLOOPError( DSO_LOOP_FWD, [335:339] + 1, DSO_LOOP_BWD );

[ errO_default, ~, ~, ~, ~, ~, nO_default] = getSortedLOOPError( ORB_LOOP_FWD, [0:9] + 1, ORB_LOOP_BWD );
[ errO_geo05, ~, ~, ~, ~, ~, nO_geo05] = getSortedLOOPError( ORB_LOOP_FWD, [55:59] + 1, ORB_LOOP_BWD );
[ errO_geo10, ~, ~, ~, ~, ~, nO_geo10] = getSortedLOOPError( ORB_LOOP_FWD, [60:64] + 1, ORB_LOOP_BWD );
[ errO_geo15, ~, ~, ~, ~, ~, nO_geo15] = getSortedLOOPError( ORB_LOOP_FWD, [65:69] + 1, ORB_LOOP_BWD );
[ errO_geo20, ~, ~, ~, ~, ~, nO_geo20] = getSortedLOOPError( ORB_LOOP_FWD, [70:74] + 1, ORB_LOOP_BWD );
[ errO_geo30, ~, ~, ~, ~, ~, nO_geo30] = getSortedLOOPError( ORB_LOOP_FWD, [75:79] + 1, ORB_LOOP_BWD );


subplot(1,2,1);
C = jet(5); C=C(end:-1:1,:);
hold on
semilogx(errM_default,500*(1:nM_default)/nM_default,'Color','black','LineWidth',1)
semilogx(errM_geo05,500*(1:nM_geo05)/nM_geo05,'Color',C(1,:),'LineWidth',2)
semilogx(errM_geo10,500*(1:nM_geo10)/nM_geo10,'Color',C(2,:),'LineWidth',2)
semilogx(errM_geo15,500*(1:nM_geo15)/nM_geo15,'Color',C(3,:),'LineWidth',2)
semilogx(errM_geo20,500*(1:nM_geo20)/nM_geo20,'Color',C(4,:),'LineWidth',2)
semilogx(errM_geo30,500*(1:nM_geo30)/nM_geo30,'Color',C(5,:),'LineWidth',2)
axis([0 15 0 500]);
grid on
set(gca, 'XTick',[0:5:20])
title('DSO');


subplot(1,2,2);
C = jet(5); C=C(end:-1:1,:);
hold on
semilogx(errO_default,500*(1:nO_default)/nO_default,'Color','black','LineWidth',1)
semilogx(errO_geo05,500*(1:nO_geo05)/nO_geo05,'Color',C(1,:),'LineWidth',2)
semilogx(errO_geo10,500*(1:nO_geo10)/nO_geo10,'Color',C(2,:),'LineWidth',2)
semilogx(errO_geo15,500*(1:nO_geo15)/nO_geo15,'Color',C(3,:),'LineWidth',2)
semilogx(errO_geo20,500*(1:nO_geo20)/nO_geo20,'Color',C(4,:),'LineWidth',2)
semilogx(errO_geo30,500*(1:nO_geo30)/nO_geo30,'Color',C(5,:),'LineWidth',2)
axis([0 15 0 500]);
grid on

legend('\delta_g=0', '\delta_g=0.5', '\delta_g=1.0', '\delta_g=1.5', '\delta_g=2.0', '\delta_g=3.0', 'Location','eastoutside')

set(gca, 'XTick',[0:5:20])
title('ORB-SLAM');
%% DSO: Figure 20. Photometric Noise.
clf

subplot(1,2,1);
[ errM_default, ~, ~, ~, ~, ~, nM_default] = getSortedLOOPError( DSO_LOOP_FWD, [0:9] + 1, DSO_LOOP_BWD );
[ errM_photo2, ~, ~, ~, ~, ~, nM_photo2] = getSortedLOOPError( DSO_LOOP_FWD, [340:344] + 1, DSO_LOOP_BWD );
[ errM_photo4, ~, ~, ~, ~, ~, nM_photo4] = getSortedLOOPError( DSO_LOOP_FWD, [345:349] + 1, DSO_LOOP_BWD );
[ errM_photo8, ~, ~, ~, ~, ~, nM_photo8] = getSortedLOOPError( DSO_LOOP_FWD, [350:354] + 1, DSO_LOOP_BWD );
[ errM_photo16, ~, ~, ~, ~, ~, nM_photo16] = getSortedLOOPError( DSO_LOOP_FWD, [355:359] + 1, DSO_LOOP_BWD );

[ errM_photo3, ~, ~, ~, ~, ~, nM_photo3] = getSortedLOOPError( DSO_LOOP_FWD, [360:364] + 1, DSO_LOOP_BWD );
[ errM_photo5, ~, ~, ~, ~, ~, nM_photo5] = getSortedLOOPError( DSO_LOOP_FWD, [365:369] + 1, DSO_LOOP_BWD );
[ errM_photo6, ~, ~, ~, ~, ~, nM_photo6] = getSortedLOOPError( DSO_LOOP_FWD, [370:374] + 1, DSO_LOOP_BWD );

[ errO_default, ~, ~, ~, ~, ~, nO_default] = getSortedLOOPError( ORB_LOOP_FWD, [0:9] + 1, ORB_LOOP_BWD );
[ errO_photo2, ~, ~, ~, ~, ~, nO_photo2] = getSortedLOOPError( ORB_LOOP_FWD, [80:84] + 1, ORB_LOOP_BWD );
[ errO_photo4, ~, ~, ~, ~, ~, nO_photo4] = getSortedLOOPError( ORB_LOOP_FWD, [85:89] + 1, ORB_LOOP_BWD );
[ errO_photo8, ~, ~, ~, ~, ~, nO_photo8] = getSortedLOOPError( ORB_LOOP_FWD, [90:94] + 1, ORB_LOOP_BWD );
[ errO_photo16, ~, ~, ~, ~, ~, nO_photo16] = getSortedLOOPError( ORB_LOOP_FWD, [95:99] + 1, ORB_LOOP_BWD );


[ errO_photo3, ~, ~, ~, ~, ~, nO_photo3] = getSortedLOOPError( ORB_LOOP_FWD, [100:104] + 1, ORB_LOOP_BWD );
[ errO_photo5, ~, ~, ~, ~, ~, nO_photo5] = getSortedLOOPError( ORB_LOOP_FWD, [105:109] + 1, ORB_LOOP_BWD );
[ errO_photo6, ~, ~, ~, ~, ~, nO_photo6] = getSortedLOOPError( ORB_LOOP_FWD, [110:114] + 1, ORB_LOOP_BWD );



C = jet(7); C=C(end:-1:1,:);
hold on
semilogx(errM_default,500*(1:nM_default)/nM_default,'Color','black','LineWidth',1)
semilogx(errM_photo2,500*(1:nM_photo2)/nM_photo2,'Color',C(1,:),'LineWidth',2)
semilogx(errM_photo3,500*(1:nM_photo3)/nM_photo3,'Color',C(2,:),'LineWidth',2)
semilogx(errM_photo4,500*(1:nM_photo4)/nM_photo4,'Color',C(3,:),'LineWidth',2)
semilogx(errM_photo5,500*(1:nM_photo5)/nM_photo5,'Color',C(4,:),'LineWidth',2)
semilogx(errM_photo6,500*(1:nM_photo6)/nM_photo6,'Color',C(5,:),'LineWidth',2)
semilogx(errM_photo8,500*(1:nM_photo8)/nM_photo8,'Color',C(6,:),'LineWidth',2)
axis([0 20 0 500]);
grid on

set(gca, 'XTick',[0:5:20])
title('DSO')


subplot(1,2,2);
C = jet(7); C=C(end:-1:1,:);
hold on
semilogx(errO_default,500*(1:nO_default)/nO_default,'Color','black','LineWidth',1)
semilogx(errO_photo2,500*(1:nO_photo2)/nO_photo2,'Color',C(1,:),'LineWidth',2)
semilogx(errO_photo3,500*(1:nO_photo3)/nO_photo3,'Color',C(2,:),'LineWidth',2)
semilogx(errO_photo4,500*(1:nO_photo4)/nO_photo4,'Color',C(3,:),'LineWidth',2)
semilogx(errO_photo5,500*(1:nO_photo5)/nO_photo5,'Color',C(4,:),'LineWidth',2)
semilogx(errO_photo6,500*(1:nO_photo6)/nO_photo6,'Color',C(5,:),'LineWidth',2)
semilogx(errO_photo8,500*(1:nO_photo8)/nO_photo8,'Color',C(6,:),'LineWidth',2)
axis([0 20 0 500]);
grid on

legend('\delta_p=0', '\delta_p=2', '\delta_p=3', '\delta_p=4', '\delta_p=5', '\delta_p=6', '\delta_p=8',  'Location','eastoutside')

set(gca, 'XTick',[0:5:20])
title('ORB-SLAM')






%% Figure 12. Full Evaluation Result (ICL_NUIM).
clf

ORB_SIM = nan(20,8);
DSO_SIM = nan(20,8);
for i=1:8
    ORB_SIM(1:10,i) = ORB_SIM_FWD{i}.allSegRMSE([1:5 21:25]);
    ORB_SIM(11:20,i) = ORB_SIM_BWD{i}.allSegRMSE([1:5 21:25]);
    
    DSO_SIM(1:10,i) = DSO_SIM_FWD{i}.allSegRMSE(1:10);
    DSO_SIM(11:20,i) = DSO_SIM_BWD{i}.allSegRMSE(1:10);
end

subplot(1,2,1)
imagesc(imresize(ORB_SIM,20,'nearest') );
caxis([0 0.1]);
hold on
plot(20*[0 9]+0.5,20*[10 10]+0.5,'black','LineWidth',2)
plot(20*[4 4]+0.5,20*[-100 100]+0.5,'black','LineWidth',2)
set(gca, 'YTick',20*[5 15]-10)
set(gca, 'YTickLabel',{'Fwd', 'Bwd'})
set(gca, 'XTick',20*(1:8)-10)
set(gca, 'XTickLabel',{'l0', 'l1', 'l2', 'l3', 'o0', 'o1', 'o2', 'o3'})
title('ORB-SLAM')

colormap(jet(100))



subplot(1,2,2)
imagesc(imresize(DSO_SIM,20,'nearest') );
caxis([0 0.1]);
hold on
plot(20*[0 9]+0.5,20*[10 10]+0.5,'black','LineWidth',2)
plot(20*[4 4]+0.5,20*[-100 100]+0.5,'black','LineWidth',2)
set(gca, 'YTick',20*[5 15]-10)
set(gca, 'YTickLabel',{'Fwd', 'Bwd'})
set(gca, 'XTick',20*(1:8)-10)
set(gca, 'XTickLabel',{'l0', 'l1', 'l2', 'l3', 'o0', 'o1', 'o2', 'o3'})
colorbar
title('DSO')

%% Figure 12. Full Evaluation Result (EuRoC MAV).
clf
ORB_MAV = nan(20,22);
DSO_MAV = nan(20,22);
for i=1:22
    ORB_MAV(1:10,i) = ORB_MAV_FWD{i}.allSegRMSE([1:5 21:25]);
    ORB_MAV(11:20,i) = ORB_MAV_BWD{i}.allSegRMSE([1:5 21:25]);
    
    DSO_MAV(1:10,i) = DSO_MAV_FWD{i}.allSegRMSE(1:10);
    DSO_MAV(11:20,i) = DSO_MAV_BWD{i}.allSegRMSE(1:10);
end


subplot(1,2,1)
imagesc(imresize(ORB_MAV,20,'nearest') );
caxis([0 0.5]);
hold on
plot(20*[0 23],20*[10 10]+0.5,'black','LineWidth',2)
plot(20*[5 5]+0.5,20*[-100 100],'black','LineWidth',2)
plot(20*[8 8]+0.5,20*[-100 100],'black','LineWidth',2)
plot(20*[11 11]+0.5,20*[-100 100],'black','LineWidth',2)
plot(20*[16 16]+0.5,20*[-100 100],'black','LineWidth',2)
plot(20*[19 19]+0.5,20*[-100 100],'black','LineWidth',2)

set(gca, 'YTick',[5 15]*20-10)
set(gca, 'YTickLabel',{'Fwd', 'Bwd'})
set(gca, 'XTick',[3 7 10 14 18 21]*20-10)
set(gca, 'XTickLabel',{'MH_l', 'V1_l', 'V2_l', 'MH_r', 'V1_r', 'V2_r'})

title('ORB-SLAM')




subplot(1,2,2)
imagesc(imresize(DSO_MAV,20,'nearest') );
caxis([0 0.5]);
hold on
plot(20*[0 23],20*[10 10]+0.5,'black','LineWidth',2)
plot(20*[5 5]+0.5,20*[-100 100],'black','LineWidth',2)
plot(20*[8 8]+0.5,20*[-100 100],'black','LineWidth',2)
plot(20*[11 11]+0.5,20*[-100 100],'black','LineWidth',2)
plot(20*[16 16]+0.5,20*[-100 100],'black','LineWidth',2)
plot(20*[19 19]+0.5,20*[-100 100],'black','LineWidth',2)



set(gca, 'YTick',[5 15]*20-10)
set(gca, 'YTickLabel',{'Fwd', 'Bwd'})
set(gca, 'XTick',[3 7 10 14 18 21]*20-10)
set(gca, 'XTickLabel',{'MH_l', 'V1_l', 'V2_l', 'MH_r', 'V1_r', 'V2_r'})
colorbar
title('DSO')


%% Figure 13. Full Evaluation Result (TUM monoVO). 
clf
ORB_LOOP = [ORB_LOOP_FWD.LOOPerrT(:,1:10) ORB_LOOP_BWD.LOOPerrT(:,1:10)]';
DSO_LOOP = [DSO_LOOP_FWD.LOOPerrT(:,1:10) DSO_LOOP_BWD.LOOPerrT(:,1:10)]';



subplot(1,2,1)
imagesc(imresize(ORB_LOOP,20,'nearest') );
caxis([0 10]);
hold on
plot(20*[0 51],20*[10 10]+0.5,'black','LineWidth',2)

set(gca, 'YTick',[5 15]*20-10)
set(gca, 'YTickLabel',{'Fwd', 'Bwd'})
set(gca, 'XTick',[1 10 20 30 40 50]*20-10)
set(gca, 'XTickLabel',{'s_01', 's_10', 's_20', 's_30', 's_40', 's_50'})

title('ORB-SLAM')




subplot(1,2,2)
imagesc(imresize(DSO_LOOP,20,'nearest') );
caxis([0 10]);
hold on
plot(20*[0 51],20*[10 10]+0.5,'black','LineWidth',2)

set(gca, 'YTick',[5 15]*20-10)
set(gca, 'YTickLabel',{'Fwd', 'Bwd'})
set(gca, 'XTick',[1 10 20 30 40 50]*20-10)
set(gca, 'XTickLabel',{'s_01', 's_10', 's_20', 's_30', 's_40', 's_50'})

colorbar
title('DSO')



