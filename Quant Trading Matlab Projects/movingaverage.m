% this creates a moving average for any stock for any period.  When
% inputting the stock, make sure to enter quotes on each side.. example
% 'GOOG'.  Same structure for designating period denominiation.


function f = movingaverage(x)
prompt = 'What is the symbol for the position to compute the moving average. ';
prompt2 = 'What is the period denomination for computing the moving average. ';
data = IBMatlab('action','history','symbol',input(prompt),'barSize',input(prompt2),'useRTH',1);
a = data.close;
prompt = 'Enter the last k elements to average in the set. ';
k = input(prompt)
movmean(a,k)
end

