%FINDX Single-variable linear level finding ("inverse" INTERP1).
%   XI = findX(X,Y,YI) estimates the XI values at which the dependent
%   variables Y reach or cross a specified target level YI (scalar value).
%   If there are multiple solutions, findX finds all of them.
%   It may be seen as the "inverse" operation of the MATLAB's function
%   INTERP1, under 'linear' method.
%
%   X is a vector containing a sequence of monotone increasing values of
%   the independent variable. Y is a vector containing the discrete values
%   of the dependent variable (underlying function).
%
%   [XI,IDEXACT] = findX(X,Y,YI) returns in IDEXACT the indices where the
%   original values of Y exactly reach the target level YI,
%   i.e. Y(IDEXACT)=YI, so interpolation was not needed.
%
% Antoni J. Canos.
% Microwave Heating Group, GEA.
% ITACA, Technical University of Valencia.
% Valencia (Spain), April 2009

function [XI] = findXVec(X,Y,YI)


%Y(isnan(Y)) = 1000000;

XI = YI;
for i=1:(size(YI,1)*size(YI,2))
    if(Y(1) > YI(i) || Y(end) < YI(i))
        XI(i)=nan;
    else
        XI(i) = findX(X,Y,YI(i));
    end
end