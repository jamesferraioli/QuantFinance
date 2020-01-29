function f = bollingerbands(x)
%UNTITLED2 this creates bollinger bands using 20 period SMA +/- 2 std
%deviations.  

data = IBMatlab('action','history','LocalSymbol','GE','barSize','1 min','useRTH',1);
a = data.close;
z = movmean(a,20);
u = (z(end))+(std(a)*2)
l = (z(end))-(std(a)*2)
end

