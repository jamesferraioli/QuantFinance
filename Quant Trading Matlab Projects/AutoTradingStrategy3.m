%this creates an auto trading system which calculates two moving averages
%for the designated stock, based on 1 minute bars.  Before running the function, assign 
%'x = stock to trade' m is assigned as the
%moving average for every 1 period.  n is assigned as the moving average
%over three periods.  When m < n, a buy order is triggered.  When m > n and
%the position indicator has been changed to 1 (the investor is long), a
%sell order is triggered.  This has been updated so that it streams live
%stock data (the high price every 5 seconds, and adds that to the moving
%average)

function f = newautotrade3(x)

data = IBMatlab('action','history','LocalSymbol','SPM8','SecType','FUT','Exchange','GLOBEX','barSize','1 min','useRTH',1);
a = data.close;

PositionIndicator = 0

for i = 1:4680
    
data= IBMatlab('action','realtime','LocalSymbol','SPM8','SecType','FUT','Exchange','GLOBEX');
pause(15)
reqId = IBMatlab('action','query','LocalSymbol','SPM8','SecType','FUT','Exchange','GLOBEX','QuotesNumber',1,'QuotesBufferSize',5000);
dataStruct = IBMatlab('action','realtime','LocalSymbol','SPM8','SecType','FUT','Exchange','GLOBEX','quotesNumber',-1);
dataStruct.data;
dataStruct.data.high
y(i)= dataStruct.data.high
pause(5)

o = [a,y];
    
z = movmean(o,20);
u = (z(end))+(std(a)*2);
l = (z(end))-(std(a)*2);

    %entry
    if y(end) == l &(PositionIndicator==0)
        orderID = IBMatlab('action','BUY','LocalSymbol','SPM8','SecType','FUT','Exchange','GLOBEX','quantity',1,'type','MKT');
        PositionIndicator = 1
    end
    
    %exit
    if y(end) == u &(PositionIndicator == 1)
        orderID = IBMatlab('action','SELL','LocalSymbol','SPM8','SecType','FUT','Exchange','GLOBEX','quantity',1,'type','MKT');
        PositionIndicator = 0
    end
    pause(1)
end;
