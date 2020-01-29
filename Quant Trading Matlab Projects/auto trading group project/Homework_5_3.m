function [MACD] = Homework_5_3(ticker, shares)
global s;
time = clock;
MA26 = 0;
MA12 = 0;
Pisitionindicator = 0;
prices = [];
temp = 0;
if length(prices) < 26
    data = IBMatlab('action','history', 'symbol', ticker, 'barSize','1 day', 'useRTH',1,'DurationValue',26);
    prices = data.close;
end
while s == 0
    MA12 = Homework_3_1(prices,12);
    MA26 = Homework_3_1(prices,26);
    c = clock;
    if c(3) > time(3)
        data = IBMatlab('action','history', 'symbol', ticker, 'barSize','1 day', 'useRTH',1,'DurationValue',26);
        prices = data.close;
        MA12 = Homework_3_1(prices,12);
        MA26 = Homework_3_1(prices,26);
        time = c;
    end
    if (MA12 > MA26) && (Pisitionindicator == 0)
        orderid = IBMatlab('action', 'BUY', 'symbol', ticker, 'quantity', shares, 'type', 'MKT');
        Pisitionindicator = 1;
        disp('bought');disp(shares);disp('shares of');disp(ticker);
    elseif (MA12 < MA26) && (Pisitionindicator == 1)
        orderid = IBMatlab('action', 'SELL', 'symbol', ticker, 'quantity', shares, 'type', 'MKT');
        Pisitionindicator = 0;
        disp('sold');disp(shares);disp('shares of');disp(ticker);
    else
        continue
    end
end
end