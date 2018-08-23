function [ segmentError, segmentStartTime, absRMSE, timespan ] = efficientEvalMAVDriftRun( mocapRaw, runlog, segmentDuration, stepDuration, dosteps )
  
    lsdOpt = importdata([runlog]);
    segmentError=inf;
    segmentStartTime=inf;
    absRMSE=inf;
    timespan=inf(1,3);
        
        
    if size(lsdOpt,1) == 0
        ['IS NAN']
        return
    end
    
    if(abs(mocapRaw(1,1) - lsdOpt(1,1)) > 500)
        lsdOpt(:,1) = 2e9-lsdOpt(:,1);
        'BWD'
    end


    [A B] = sort(lsdOpt(:,1));
    lsdOpt = lsdOpt(B,:);


    if sum(sum(isnan(lsdOpt))) > 0
        ['IS NAN']
        return
    end

    lsdPos = lsdOpt(:,2:4);
    lsdTme = lsdOpt(:,1);

    % assiciate.
    gtPos = zeros(size(lsdTme,1),3);
    gtID = 1;
    for i=1:size(lsdTme,1)
        while(lsdTme(i) - mocapRaw(gtID,1) > 0.01)
            gtID = gtID+1;
            if(gtID > size(mocapRaw,1))
                'ERROR, cannot associate frame well'    
            end
        end

        if(abs(lsdTme(i) - mocapRaw(gtID,1)) > 0.05)
            'ERROR, cannot associate frame well'
        end
        gtPos(i,1:3) = mocapRaw(gtID,2:4);
    end

    
    
    goodIDX = ~isnan(gtPos(:,1)) & ~isnan(lsdPos(:,1));
    gtPos = gtPos(goodIDX,:);
    lsdPos = lsdPos(goodIDX,:);
    lsdTme = lsdTme(goodIDX,:);
    

    startframe = 1;
    
    segmentError = [];
    segmentStartTime = [];
    idx=1;
    
    if dosteps==1
        while 1

            startTime = lsdTme(startframe);

            % go through poses, take the first one where 
            endFrame = find(lsdTme(:) >= startTime+segmentDuration,1);

            if(size(endFrame,1) < 1)
                break;  % end reached.
            end

            if(endFrame-startframe < 3 || sum(sum(isnan(lsdPos(startframe:endFrame,:)))) > 0)
                % NAN interval: result is NAN.
                segmentError(idx) = nan;
                segmentStartTime(idx) = startTime;

            else 
                 % EVAL segment
                absRMSE = AlignSimEfficient( gtPos(startframe:endFrame,:), lsdPos(startframe:endFrame,:) );

                segmentError(idx) = absRMSE;
                segmentStartTime(idx) = startTime;
            end
            idx=idx+1;

            nextFrame = find(lsdTme(:) >= startTime+stepDuration,1);
            if(size(nextFrame,1) < 1)
                break;  % end reached.
            end
            startframe = nextFrame;
        end
    end

    absRMSE =  AlignSimEfficient( gtPos, lsdPos );
    timespan = [lsdOpt(1,1) lsdOpt(end,1) size(lsdOpt,1)];
end

