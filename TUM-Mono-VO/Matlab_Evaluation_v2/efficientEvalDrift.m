function [rmse, errTrafo, errAlign, errR, errS, abserrA, abserrE, nkf] = efficientEvalDrift( benchmark, sequence, plotfig )

errAlign=inf;
errR=inf;
errS=inf;
abserrA=inf;
abserrE=inf;
rmse=inf;
errTrafo=inf(4);
nkf=0;



mocapRaw = sequence.mocapRaw;
lsdOpt = importdata([benchmark]);


if(size(lsdOpt,1)==0)
    ['NO DATAA ' sequence.name]
    return
end

if(abs(mocapRaw(1,1) - lsdOpt(1,1)) > 1000)
    lsdOpt(:,1) = 2e9-lsdOpt(:,1);
end



[A B] = sort(lsdOpt(:,1));
lsdOpt = lsdOpt(B,:);


if(nargin < 3 )
    plotfig=0;
end

if sum(sum(isnan(lsdOpt))) > 0
    ['IS NAN' sequence.name]
    return
end

lsdPos = lsdOpt(:,2:4);
lsdTme = lsdOpt(:,1);
nkf = size(lsdTme,1);

% assiciate.
gtPos = zeros(size(lsdTme,1),3);
gtID = 1;
for i=1:size(lsdTme,1)
    while(lsdTme(i) - mocapRaw(gtID,1) > 0.001)
        gtID = gtID+1;
    end
    
    if(abs(lsdTme(i) - mocapRaw(gtID,1)) > 0.001)
        'ERROR, cannot associate frame well'
    end
    gtPos(i,1:3) = mocapRaw(gtID,2:4);
end

nframes = size(mocapRaw,1);
timesAlign =  [mocapRaw(1,1) mocapRaw(floor(nframes/2),1)];
timesEval =  [mocapRaw(ceil(nframes/2),1) mocapRaw(nframes,1)];


% align start segment
lsdFramesAlign = (lsdTme >= timesAlign(1)) & (lsdTme <= timesAlign(2)) & (~isnan(gtPos(:,1)));
lsdPosAlign = lsdPos(lsdFramesAlign,:);
gtPosAlign = gtPos(lsdFramesAlign,:);
%lsdTmeAlign = lsdTme(lsdFramesAlign,:);

lsdFramesEval = (lsdTme >= timesEval(1)) & (lsdTme <= timesEval(2)) & (~isnan(gtPos(:,1)));
lsdPosEval = lsdPos(lsdFramesEval,:);
gtPosEval = gtPos(lsdFramesEval,:);
%lsdTmeEval = lsdTme(lsdFramesEval,:);

% align (7DoF)
if(size(lsdFramesEval,1)==0 || size(lsdFramesAlign,1)==0)
    ['IS INCOMPLETE' sequence.name]
    return
end



[ abserrE, RE, tE, scaleE ] = AlignSimEfficient( gtPosEval, lsdPosEval );
[ abserrA, RA, tA, scaleA ] = AlignSimEfficient( gtPosAlign, lsdPosAlign );




if(isnan(abserrE) || isnan(abserrA) || isnan(scaleE) || isnan(scaleA))
    return
end





% get sequence aligned by EVAL.
lsdPosE_aligned = scaleE * lsdPos * RE' + repmat(tE', size(lsdPos,1), 1);

% get sequence aligned by ALIGN.
lsdPosA_aligned = lsdPos * scaleA * RA' + repmat(tA', size(lsdPos,1), 1);

errS = scaleA/scaleE;  % as factor
errorquat = dcm2quat( RE*RA');
errR = 2*acos(errorquat(1))*180/pi;      % as degree
errAlign = (sum(sum((lsdPosE_aligned-lsdPosA_aligned).^2)) / size(lsdPos,1))^0.5;

if( sum(sum(isnan(RE+RA))) > 0)
    errTrafo=inf(4);
else
    errTrafo = [scaleE*RE tE; 0 0 0 1] * [scaleA*RA tA; 0 0 0 1]^-1;      % as degree
end


[ rmse, ~, ~, ~ ] = AlignSimEfficient( [gtPosAlign; gtPosEval], [lsdPosAlign; lsdPosEval] );






if(plotfig==1)

    clf
    subplot(1,3,1)
    hold on
    plot(lsdTme-lsdTme(1), lsdPosA_aligned,'blue','LineWidth',2);
    plot(lsdTme-lsdTme(1), lsdPosE_aligned,'red','LineWidth',2);
    plot(lsdTme-lsdTme(1), gtPos,'green','LineWidth',3,'LineStyle','--');
    grid on
    axis([0 lsdTme(end)-lsdTme(1) min(min(min(lsdPosE_aligned)),min(min(lsdPosA_aligned)))-4 max(max(max(lsdPosE_aligned)),max(max(lsdPosA_aligned)))+4])

    subplot(1,3,2)
    hold on
    plot(lsdTme-lsdTme(1), lsdPosA_aligned,'blue','LineWidth',2);
    plot(lsdTme-lsdTme(1), lsdPosE_aligned,'red','LineWidth',2);
    plot(lsdTme-lsdTme(1), gtPos,'green','LineWidth',3,'LineStyle','--');
    grid on
    axis([0 lsdTme(end)-lsdTme(1) min(min(min(lsdPosE_aligned)),min(min(lsdPosA_aligned)))-4 max(max(max(lsdPosE_aligned)),max(max(lsdPosA_aligned)))+4])
    
    subplot(1,3,3)
    hold on
    plot(lsdTme-lsdTme(1), lsdPosA_aligned,'blue','LineWidth',2);
    plot(lsdTme-lsdTme(1), lsdPosE_aligned,'red','LineWidth',2);
    plot(lsdTme-lsdTme(1), gtPos,'green','LineWidth',3,'LineStyle','--');
    grid on
    axis([0 lsdTme(end)-lsdTme(1) min(min(min(lsdPosE_aligned)),min(min(lsdPosA_aligned)))-4 max(max(max(lsdPosE_aligned)),max(max(lsdPosA_aligned)))+4])

end


if(plotfig==2)

    
H = ([lsdPosE_aligned; lsdPosA_aligned])' * ([lsdPosE_aligned; lsdPosA_aligned]);
[U,S,V] = svd(H);
R = V*U';
if det(R) < 0
    V(:,3) = V(:,3) * -1;
    R = V*U';
end


    lsdPosE_aligned_rot = lsdPosE_aligned*U;
    lsdPosA_aligned_rot = lsdPosA_aligned*U;
    gtPos_rot = gtPos*U;

    
    d1=2;
    d2=1;
    
    n=size(gtPos_rot,1);
    clf
    subplot(1,2,1)
    hold on
    plot(gtPos_rot(1:(n/2),d1), gtPos_rot(1:(n/2),d2),'green','LineWidth',3);
    plot(gtPos_rot((n/2):end,d1), gtPos_rot((n/2):end,d2),'green','LineWidth',3);
    plot(lsdPosE_aligned_rot(:,d1), lsdPosE_aligned_rot(:,d2),'red','LineWidth',2)
    plot(lsdPosA_aligned_rot(:,d1), lsdPosA_aligned_rot(:,d2),'blue','LineWidth',2)
    %axis equal
    grid on

        subplot(1,2,2)
    hold on
    plot(gtPos_rot(1:(n/2),d1), gtPos_rot(1:(n/2),d2),'green','LineWidth',3);
    plot(gtPos_rot((n/2):end,d1), gtPos_rot((n/2):end,d2),'green','LineWidth',3);
    plot(lsdPosE_aligned_rot(:,d1), lsdPosE_aligned_rot(:,d2),'red','LineWidth',2)
    plot(lsdPosA_aligned_rot(:,d1), lsdPosA_aligned_rot(:,d2),'blue','LineWidth',2)
   % axis equal
    grid on
end

end

 