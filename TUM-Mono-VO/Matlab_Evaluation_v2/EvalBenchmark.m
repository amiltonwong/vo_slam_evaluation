


% set this to the supplementary files folder.
FILEPATH = '/work/DSO_supplementary'





%% ORB ALL

logPath_fwd = [FILEPATH '/ORB_SLAM_Forward/'];
logPath_bwd = [FILEPATH '/ORB_SLAM_Backward/'];
logPath_rt = [FILEPATH '/ORB_SLAM_Realtime_v2/'];

options=0:114
[ ORB_LOOP_BWD ] = evalLOOPdataset( logPath_bwd, options, errorPerSequenceBenchmark(FILEPATH) );
[ ORB_LOOP_FWD ] = evalLOOPdataset( logPath_fwd, options, errorPerSequenceBenchmark(FILEPATH) );

options=1000:1024
[ ORB_MAV_BWD ] = evalMAVdataset( logPath_bwd, options, errorPerSequenceMAV(FILEPATH) );
[ ORB_SIM_BWD ] = evalMAVdataset( logPath_bwd, options, errorPerSequenceSIM(FILEPATH) );
[ ORB_MAV_FWD ] = evalMAVdataset( logPath_fwd, options, errorPerSequenceMAV(FILEPATH) );
[ ORB_SIM_FWD ] = evalMAVdataset( logPath_fwd, options, errorPerSequenceSIM(FILEPATH) );

save('ORB.mat', 'ORB_LOOP_BWD', 'ORB_LOOP_FWD', 'ORB_MAV_BWD', 'ORB_SIM_BWD', 'ORB_MAV_FWD', 'ORB_SIM_FWD');


options=100:109
[ ORB_LOOP_RTFIX ] = evalLOOPdataset( logPath_rt, options, errorPerSequenceBenchmark(FILEPATH) );
[ ORB_MAV_RTFIX ] = evalMAVdataset( logPath_rt, options, errorPerSequenceMAV(FILEPATH) );
[ ORB_SIM_RTFIX ] = evalMAVdataset( logPath_rt, options, errorPerSequenceSIM(FILEPATH) );
save('ORB-REALTIME_FIX.mat', 'ORB_LOOP_RT', 'ORB_MAV_RT', 'ORB_SIM_RT');





%% MULTI ALL

logPath_fwd = [FILEPATH '/DS-VO_Forward/'];
logPath_bwd = [FILEPATH '/DS-VO_Backward/'];
logPath_rt = [FILEPATH '/DS-VO_Realtime/'];



options=0:374
[ DSO_LOOP_BWD ] = evalLOOPdataset( logPath_bwd, options, errorPerSequenceBenchmark(FILEPATH) );
[ DSO_LOOP_FWD ] = evalLOOPdataset( logPath_fwd, options, errorPerSequenceBenchmark(FILEPATH) );


options=0:9
[ DSO_MAV_BWD ] = evalMAVdataset( logPath_bwd, options, errorPerSequenceMAV(FILEPATH) );
[ DSO_SIM_BWD ] = evalMAVdataset( logPath_bwd, options, errorPerSequenceSIM(FILEPATH) );
[ DSO_MAV_FWD ] = evalMAVdataset( logPath_fwd, options, errorPerSequenceMAV(FILEPATH) );
[ DSO_SIM_FWD ] = evalMAVdataset( logPath_fwd, options, errorPerSequenceSIM(FILEPATH) );

save('DSO.mat', 'DSO_LOOP_BWD', 'DSO_LOOP_FWD', 'DSO_MAV_BWD', 'DSO_SIM_BWD', 'DSO_MAV_FWD', 'DSO_SIM_FWD');


options=1000:1019
[ DSO_LOOP_RT ] = evalLOOPdataset( logPath_rt, options, errorPerSequenceBenchmark(FILEPATH) );
[ DSO_MAV_RT ] = evalMAVdataset( logPath_rt, options, errorPerSequenceMAV(FILEPATH) );
[ DSO_SIM_RT ] = evalMAVdataset( logPath_rt, options, errorPerSequenceSIM(FILEPATH) );
save('DSO-REALTIME.mat', 'DSO_LOOP_RT', 'DSO_MAV_RT', 'DSO_SIM_RT');


