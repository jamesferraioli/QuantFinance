%Order Execution

function [Trade] = execution(ticker, size, side)
remaining = size;
data = IBMatlab('action','query', 'symbol', ticker);
ask = data.askSize;
bid = data.bidSize;
while remaining > 0
    if side == 1
        if (size > ask) && (remaining > ask/3)
            orderid = IBMatlab('action', 'BUY', 'symbol', ticker, 'quantity', ask/3, 'type', 'MKT');
            remaining = remaining - ask/3;
        elseif remaining > size/3
            orderid = IBMatlab('action', 'BUY', 'symbol', ticker, 'quantity', size/3, 'type', 'MKT');
            remaining = remaining - size/3;
        else
            orderid = IBMatlab('action', 'BUY', 'symbol', ticker, 'quantity', remaining, 'type', 'MKT');
            remaining = 0;
        end
    elseif side == -1
        if (size > bid) && (remaining > bid/3)
            orderid = IBMatlab('action', 'SELL', 'symbol', ticker, 'quantity', bid/3, 'type', 'MKT');
            remaining = remaining - bid/3;
        elseif remaining > size/3
            orderid = IBMatlab('action', 'SELL', 'symbol', ticker, 'quantity', size/3, 'type', 'MKT');
            remaining = remaining - size/3;
        else
            orderid = IBMatlab('action', 'SELL', 'symbol', ticker, 'quantity', remaining, 'type', 'MKT');
            remaining = 0;
        end
    else
        disp("order orientation not understood, please input -1 or 1");
        return
    end
Trade = "completed";
disp(Trade);
end
end
    