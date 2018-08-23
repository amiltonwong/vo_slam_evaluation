function [ kfPerSec ] = getLOOPKfPerSec( DATASET, ids, DATASET2 )
n = size(DATASET.LOOPerrR,1);
sqs=1:n;
secs = 0*sqs';
for i=sqs
    secs(i) = DATASET.sequences{i}.mocapRaw(end,1)-DATASET.sequences{i}.mocapRaw(1,1);
end


nkf = DATASET.LOOPNKF(:,ids);
nkf(nkf==0 | nkf == inf) = nan;
nkf = nkf ./ repmat(secs,1,size(ids,1)*size(ids,2));
kfPerSec = nanmean(nanmean(nkf));




if(nargin > 2)
    n = size(DATASET2.LOOPerrR,1);
    sqs=1:n;
    secs = 0*sqs';
    for i=sqs
        secs(i) = DATASET2.sequences{i}.mocapRaw(end,1)-DATASET2.sequences{i}.mocapRaw(1,1);
    end
    
    nkf2 = DATASET2.LOOPNKF(:,ids);
    nkf2(nkf2==0 | nkf2 == inf) = nan;
    nkf2 = nkf2 ./ repmat(secs,1,size(ids,1)*size(ids,2));

    kfPerSec = nanmean(nanmean([nkf nkf2]));
end



end

