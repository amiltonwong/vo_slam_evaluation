function [ SIMdatasets] = errorPerSequenceSIM( supplementaryFolder )

idx=1
SIMdatasets = {};
SIMdatasets{idx}.name = 'sim_living_traj0';

idx=idx+1;
SIMdatasets{idx}.name = 'sim_living_traj1';

idx=idx+1;
SIMdatasets{idx}.name = 'sim_living_traj2';

idx=idx+1;
SIMdatasets{idx}.name = 'sim_living_traj3';

idx=idx+1;
SIMdatasets{idx}.name = 'sim_office_traj0';

idx=idx+1;
SIMdatasets{idx}.name = 'sim_office_traj1';

idx=idx+1;
SIMdatasets{idx}.name = 'sim_office_traj2';

idx=idx+1;
SIMdatasets{idx}.name = 'sim_office_traj3';


for d=1:size(SIMdatasets,2)
    tms = importdata([ supplementaryFolder '/timesFiles/' SIMdatasets{d}.name '.txt']);
    num= size(tms,1);
    SIMdatasets{d}.startTime = tms(1,2);
    SIMdatasets{d}.endTime = tms(end,2);
    SIMdatasets{d}.seconds = SIMdatasets{d}.endTime - SIMdatasets{d}.startTime;
    SIMdatasets{d}.mocapRaw = importdata([ supplementaryFolder '/gtFiles/' SIMdatasets{d}.name '.txt']);
end


end


