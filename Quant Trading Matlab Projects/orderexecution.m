


function f = orderexecution(x)

s = 'GE'

data = IBMatlab('action','history','Symbol',s,'barSize','1 min','useRTH',1);
a = data.close;
w = movmean(a,20);
u = (w(end))+(std(a)*2)
l = (w(end))-(std(a)*2)



data= IBMatlab('action','query','Symbol',s);
reqId = IBMatlab('action','query','symbol',s,'QuotesNumber',1,'QuotesBufferSize',5000);

data.bidPrice
data.askPrice
z = data.volume
w = round(1/4*y)
r = round(1/10*y)

if t > 5000 & t < (1/10)*z
    orderID = IBMatlab('action','BUY','Symbol',s,'quantity',w,'type','LMT','limitPrice',round(l))
    orderID = IBMatlab('action','BUY','Symbol',s,'quantity',w,'type','LMT','limitPrice',round(l))
    orderID = IBMatlab('action','BUY','Symbol',s,'quantity',w,'type','LMT','limitPrice',round(l))
    orderID = IBMatlab('action','BUY','Symbol',s,'quantity',w,'type','LMT','limitPrice',round(l))
else if t > 5000 & t > (1/10)*z
    orderID = IBMatlab('action','BUY','Symbol',s,'quantity',r,'type','LMT','limitPrice',round(l))  
    orderID = IBMatlab('action','BUY','Symbol',s,'quantity',r,'type','LMT','limitPrice',round(l))
    orderID = IBMatlab('action','BUY','Symbol',s,'quantity',r,'type','LMT','limitPrice',round(l))
    orderID = IBMatlab('action','BUY','Symbol',s,'quantity',r,'type','LMT','limitPrice',round(l))
    orderID = IBMatlab('action','BUY','Symbol',s,'quantity',r,'type','LMT','limitPrice',round(l))
    orderID = IBMatlab('action','BUY','Symbol',s,'quantity',r,'type','LMT','limitPrice',round(l))
    orderID = IBMatlab('action','BUY','Symbol',s,'quantity',r,'type','LMT','limitPrice',round(l))
    orderID = IBMatlab('action','BUY','Symbol',s,'quantity',r,'type','LMT','limitPrice',round(l))
    orderID = IBMatlab('action','BUY','Symbol',s,'quantity',r,'type','LMT','limitPrice',round(l))
    orderID = IBMatlab('action','BUY','Symbol',s,'quantity',r,'type','LMT','limitPrice',round(l))
else
    orderID = IBMatlab('action','BUY','Symbol',s,'quantity',t,'type','LMT','limitPrice',round(l))
end
end
