% returns the minimum and maximum values for a defined stock over a trading
% period.

function f = minmax(x)

data = IBMatlab('action','history','symbol','GOOG','barSize','3 mins','useRTH',1);
b = data.close
min(b)
max(b)
end