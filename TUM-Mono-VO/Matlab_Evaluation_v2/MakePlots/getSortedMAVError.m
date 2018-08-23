function [ allErrorsRMSE, n ] = getSortedMAVError( DATASET, ids, timeTH, sqs, DATASET2 )

k = size(ids,2);
n = size(DATASET,2);

if(nargin < 4)
    sqs=1:n;
end

n = size(sqs,2);

idx = [];
for i=ids
    idx(size(idx,1)*size(idx,2)+1) = find(DATASET{1}.options==i);
end



allErrorsRMSE = nan(k*n,1);
for i=sqs
    rmse = DATASET{i}.allSegRMSE(idx);
    tme = DATASET{i}.allSegTimespan(idx,2)-DATASET{i}.allSegTimespan(idx,1);
    
    rmse(tme < DATASET{i}.seconds*timeTH) = inf;
    
    allErrorsRMSE((i-1)*k+(1:k)) = rmse;
end

allErrorsRMSE = sort(allErrorsRMSE);
n = size(allErrorsRMSE,1)*size(allErrorsRMSE,2);



if(nargin > 4)
     [ allErrorsRMSE2, n2 ] = getSortedMAVError( DATASET2, ids, timeTH, sqs );
     
     allErrorsRMSE = [allErrorsRMSE; allErrorsRMSE2];
     allErrorsRMSE = sort(allErrorsRMSE(:));
    n = size(allErrorsRMSE,1)*size(allErrorsRMSE,2);
end




end

