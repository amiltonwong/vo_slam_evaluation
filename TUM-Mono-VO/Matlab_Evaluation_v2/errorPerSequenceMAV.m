function [ MAVdatasets] = errorPerSequenceMAV( supplementaryFolder )

MAVdatasets = {};
MAVdatasets{1}.name = 'mav_MH_01_easy';
MAVdatasets{1}.startframe = 950;
MAVdatasets{1}.endframe = 3600;

MAVdatasets{2}.name = 'mav_MH_02_easy';
MAVdatasets{2}.startframe = 800;
MAVdatasets{2}.endframe = 3000;

MAVdatasets{3}.name = 'mav_MH_03_medium';
MAVdatasets{3}.startframe = 410;
MAVdatasets{3}.endframe = 2600;

MAVdatasets{4}.name = 'mav_MH_04_difficult';
MAVdatasets{4}.startframe = 445;
MAVdatasets{4}.endframe = 1925;

MAVdatasets{5}.name = 'mav_MH_05_difficult';
MAVdatasets{5}.startframe = 460;
MAVdatasets{5}.endframe = 2200;

MAVdatasets{6}.name = 'mav_V1_01_easy';
MAVdatasets{6}.startframe = 0;
MAVdatasets{6}.endframe = 2800;

MAVdatasets{7}.name = 'mav_V1_02_medium';
MAVdatasets{7}.startframe = 115;
MAVdatasets{7}.endframe = 1600;

MAVdatasets{8}.name = 'mav_V1_03_difficult';
MAVdatasets{8}.startframe = 250;
MAVdatasets{8}.endframe = 2020;

MAVdatasets{9}.name = 'mav_V2_01_easy';
MAVdatasets{9}.startframe = 0;
MAVdatasets{9}.endframe = 2130;

MAVdatasets{10}.name = 'mav_V2_02_medium';
MAVdatasets{10}.startframe = 100;
MAVdatasets{10}.endframe = 2230;

MAVdatasets{11}.name = 'mav_V2_03_difficult';
MAVdatasets{11}.startframe = 115;
MAVdatasets{11}.endframe = 1880;


MAVdatasets{12}.name = 'mav2_MH_01_easy';
MAVdatasets{12}.startframe = 950;
MAVdatasets{12}.endframe = 3600;

MAVdatasets{13}.name = 'mav2_MH_02_easy';
MAVdatasets{13}.startframe = 800;
MAVdatasets{13}.endframe = 3000;

MAVdatasets{14}.name = 'mav2_MH_03_medium';
MAVdatasets{14}.startframe = 410;
MAVdatasets{14}.endframe = 2600;

MAVdatasets{15}.name = 'mav2_MH_04_difficult';
MAVdatasets{15}.startframe = 445;
MAVdatasets{15}.endframe = 1925;

MAVdatasets{16}.name = 'mav2_MH_05_difficult';
MAVdatasets{16}.startframe = 460;
MAVdatasets{16}.endframe = 2200;

MAVdatasets{17}.name = 'mav2_V1_01_easy';
MAVdatasets{17}.startframe = 0;
MAVdatasets{17}.endframe = 2800;

MAVdatasets{18}.name = 'mav2_V1_02_medium';
MAVdatasets{18}.startframe = 115;
MAVdatasets{18}.endframe = 1600;

MAVdatasets{19}.name = 'mav2_V1_03_difficult';
MAVdatasets{19}.startframe = 250;
MAVdatasets{19}.endframe = 2020;

MAVdatasets{20}.name = 'mav2_V2_01_easy';
MAVdatasets{20}.startframe = 0;
MAVdatasets{20}.endframe = 2130;

MAVdatasets{21}.name = 'mav2_V2_02_medium';
MAVdatasets{21}.startframe = 100;
MAVdatasets{21}.endframe = 2230;

MAVdatasets{22}.name = 'mav2_V2_03_difficult';
MAVdatasets{22}.startframe = 115;
MAVdatasets{22}.endframe = 1880;



for d=1:22
    tms = importdata([ supplementaryFolder '/timesFiles/' MAVdatasets{d}.name '.txt']);
    num= size(tms,1);
    MAVdatasets{d}.startTime = tms(MAVdatasets{d}.startframe+1,2);
    MAVdatasets{d}.endTime = tms(MAVdatasets{d}.endframe+1,2);
    MAVdatasets{d}.seconds = MAVdatasets{d}.endTime - MAVdatasets{d}.startTime;
    MAVdatasets{d}.mocapRaw = importdata([ supplementaryFolder '/gtFiles/' MAVdatasets{d}.name '.txt']);
end



end