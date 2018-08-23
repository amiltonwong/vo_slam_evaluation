function [ LOOPdataset ] = evalLOOPdataset( logPath, options, s , LOOPdataset)


LOOPdataset.sequences=s;
LOOPdataset.LOOPerrT = zeros(size(s,2), size(options,2));
LOOPdataset.LOOPerrR = zeros(size(s,2), size(options,2));
LOOPdataset.LOOPerrS = zeros(size(s,2), size(options,2));
LOOPdataset.LOOPerrRMSE = zeros(size(s,2), size(options,2));
LOOPdataset.LOOPabserrA = zeros(size(s,2), size(options,2));
LOOPdataset.LOOPabserrE = zeros(size(s,2), size(options,2));
LOOPdataset.LOOPNKF = zeros(size(s,2), size(options,2));



%%

for oi=1:size(options,2)
for si=1:size(s,2)
%    try
        fle = [logPath s{si}.name '_' num2str(options(oi)) '.txt'];


        
        if(LOOPdataset.LOOPabserrE(si,oi) > 0 || isnan(LOOPdataset.LOOPabserrE(si,oi)))
            ['EXISTS ' fle]
            continue;
        end

        if(~exist(fle))
            ['SKIP ' fle]
            continue;
        end

        [rmse, errTrafo, errAlign, errR, errS, abserrA, abserrE, nkf] = efficientEvalDrift(fle, s{si},0);

        
        [s{si}.name ' with ' num2str(options(oi)) ' : ' num2str(abserrA) ' TO ' num2str(abserrE) ';  eT ' num2str(errAlign) ' eR ' num2str(errR) ' eS ' num2str(errS)]
        
        

        LOOPdataset.LOOPerrT(si,oi) = errAlign;
        LOOPdataset.LOOPerrRMSE(si,oi) = rmse;
        LOOPdataset.LOOPerrR(si,oi) = errR;
        LOOPdataset.LOOPerrS(si,oi) = errS;
        LOOPdataset.LOOPabserrA(si,oi) = abserrA;
        LOOPdataset.LOOPabserrE(si,oi) = abserrE;
        LOOPdataset.LOOPNKF(si,oi) = nkf;
%    catch
%        'ERROR'
%    end
end        
end

end

