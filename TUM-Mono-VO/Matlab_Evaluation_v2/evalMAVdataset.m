function [ MAVdatasets ] = evalMAVdataset( logPath, options, MAVdatasets )

intervalDuration=10;
intervalStep = 5;

for si=1:size(MAVdatasets,2)
    
    numSteps = ceil((MAVdatasets{si}.endTime-MAVdatasets{si}.startTime)/intervalStep)+5;
    allSegError = zeros(size(options,2), numSteps);
    allSegStartTimes = zeros(size(options,2), numSteps);
    allSegRMSE = zeros(size(options,2), 1);
    allSegTimespan = zeros(size(options,2), 3);

    
for oi=1:size(options,2)
    %try
         runlog = [logPath MAVdatasets{si}.name '_' num2str(options(oi)) '.txt'];

        if(~exist(runlog))
            ['SKIP ' runlog]
            continue;
        end

        %if(~isnan(allSegRMSE(oi)))
        %    ['EXISTS ' runlog]
        %    continue;
        %end
        

        [ segmentError, segmentStart, absRMSE, timeSpan ] = efficientEvalMAVDriftRun( MAVdatasets{si}.mocapRaw , runlog,intervalDuration,intervalStep,1 );

        allSegError(oi,1:size(segmentError,2)) = segmentError;
        allSegStartTimes(oi,1:size(segmentStart,2)) = segmentStart;
        allSegRMSE(oi) = absRMSE;
        allSegTimespan(oi,:) = timeSpan;

        if(~isnan(absRMSE))
            [MAVdatasets{si}.name ' ' ...
                num2str(options(oi)) ': ' ...
                num2str(absRMSE) ' (dur ' ...
                num2str(timeSpan(2)-timeSpan(1)) ...
                ' / ' num2str(MAVdatasets{si}.seconds) '). steps: ' ...
                num2str(size(segmentStart,2)) '; tracked ' ...
                num2str(timeSpan(3))]
        end
    %catch
    %    'ERROR'
    %end
end

    MAVdatasets{si}.allSegError = allSegError;
    MAVdatasets{si}.allSegStartTimes = allSegStartTimes;
    MAVdatasets{si}.allSegRMSE = allSegRMSE;
    MAVdatasets{si}.allSegTimespan = allSegTimespan;
    MAVdatasets{si}.options = options;

end
end

