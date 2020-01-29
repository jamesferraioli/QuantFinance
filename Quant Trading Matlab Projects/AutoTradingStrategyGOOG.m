%this creates an auto trading system which buys when the last high price
%hits the lower band of the bollinger band, on a continued moving average
%basis.  It sells when the last high price hits the upper band on the
%bollinger bands.




function f = newautotradeGOOG(x)

s = 'GE'

data = IBMatlab('action','history','Symbol',s,'barSize','1 min','useRTH',1);
a = data.close;

PositionIndicator = 0 
PositionIndicator2 = 0 
for i = 1:4680

data= IBMatlab('action','realtime','Symbol',s);
pause(15)
reqId = IBMatlab('action','query','symbol',s,'QuotesNumber',1,'QuotesBufferSize',5000);
dataStruct = IBMatlab('action','realtime','Symbol',s,'quotesNumber',-1);
dataStruct.data;
dataStruct.data.high
y(i)= dataStruct.data.high
pause(5)

o = [a,y];

z = movmean(o,20);
w = movmean(a,20);
u = (w(end))+(std(a)*2)
l = (w(end))-(std(a)*2)

    %entry
    if y(end) == l &(PositionIndicator==0)
       orderexeuction(s)
        PositionIndicator = 1
    end
    
    %exit
    if y(end) == u &(PositionIndicator==1)
        sellorderexecution(s)
        PositionIndicator = 0
    end
    
      %entry
    if y(end) == u &(PositionIndicator2==0)
        ubbuyorderexecution(s)
        PositionIndicator2 = 1
    end
    
    %exit
    if y(end) == z &(PositionIndicator2==1)
        mbsellorderexecution(s)
        PositionIndicator2 = 0
    end
    
    
    
    pause(1)
end;
