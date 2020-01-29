%this creates an auto trading system which calculates two moving averages
%for the designated stock, based on 1 minute bars.  Before running the function, assign 
%'x = stock to trade' m is assigned as the
%moving average for every 1 period.  n is assigned as the moving average
%over three periods.  When m < n, a buy order is triggered.  When m > n and
%the position indicator has been changed to 1 (the investor is long), a
%sell order is triggered.

function f = newautotrade(x)

data = IBMatlab('action','history','LocalSymbol','ESH8','SecType','FUT','Exchange','GLOBEX','barSize','1 min','useRTH',1);
a = data.close;

m = movmean(a,1)
n = movmean(a,4)

PositionIndicator = 0
for i = 1:100
    
    data = IBMatlab('action','query','LocalSymbol','ESH8','SecType','FUT','Exchange','GLOBEX')
    data.lastPrice;
    
    %entry
    if m(end) < n(end) &(PositionIndicator==0)
        orderID = IBMatlab('action','BUY','LocalSymbol','ESH8','SecType','FUT','Exchange','GLOBEX','quantity',1,'type','MKT');
        PositionIndicator = 1
    end
    
    %exit
    if m(end) > n(end) &(PositionIndicator == 1)
        orderID = IBMatlab('action','SELL','LocalSymbol','ESH8','SecType','FUT','Exchange','GLOBEX','quantity',1,'type','MKT');
        PositionIndicator = 0
    end
    pause(1)
end;
