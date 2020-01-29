


function f = sellorderexecution(x)

s = 'GE'
t = 6000

data = IBMatlab('action','history','Symbol',s,'barSize','1 min','useRTH',1);
a = data.close;
w = movmean(a,20);
u = (w(end))+(std(a)*2)
l = (w(end))-(std(a)*2)



data= IBMatlab('action','query','Symbol',s);
reqId = IBMatlab('action','query','symbol',s,'QuotesNumber',1,'QuotesBufferSize',5000);

data.bidPrice
data.askPrice
y = data.volume
w = round(1/4*t)
r = round(1/10*t)

if t > 5000 & t < (1/10)*y
    orderID = IBMatlab('action','SELL','Symbol',s,'quantity',w,'type','LMT','limitPrice',round(l))
    orderID = IBMatlab('action','SELL','Symbol',s,'quantity',w,'type','LMT','limitPrice',round(l))
    orderID = IBMatlab('action','SELL','Symbol',s,'quantity',w,'type','LMT','limitPrice',round(l))
    orderID = IBMatlab('action','SELL','Symbol',s,'quantity',w,'type','LMT','limitPrice',round(l))
else if t > 5000 & t > (1/10)*y
    orderID = IBMatlab('action','SELL','Symbol',s,'quantity',r,'type','LMT','limitPrice',round(l))  
    orderID = IBMatlab('action','SELL','Symbol',s,'quantity',r,'type','LMT','limitPrice',round(l))
    orderID = IBMatlab('action','SELL','Symbol',s,'quantity',r,'type','LMT','limitPrice',round(l))
    orderID = IBMatlab('action','SELL','Symbol',s,'quantity',r,'type','LMT','limitPrice',round(l))
    orderID = IBMatlab('action','SELL','Symbol',s,'quantity',r,'type','LMT','limitPrice',round(l))
    orderID = IBMatlab('action','SELL','Symbol',s,'quantity',r,'type','LMT','limitPrice',round(l))
    orderID = IBMatlab('action','SELL','Symbol',s,'quantity',r,'type','LMT','limitPrice',round(l))
    orderID = IBMatlab('action','SELL','Symbol',s,'quantity',r,'type','LMT','limitPrice',round(l))
    orderID = IBMatlab('action','SELL','Symbol',s,'quantity',r,'type','LMT','limitPrice',round(l))
    orderID = IBMatlab('action','SELL','Symbol',s,'quantity',r,'type','LMT','limitPrice',round(l))
else
    orderID = IBMatlab('action','SELL','Symbol',s,'quantity',t,'type','LMT','limitPrice',round(l))
end
end
