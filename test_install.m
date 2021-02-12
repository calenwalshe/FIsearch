fileID = fopen('./priorh.bin');
priorh = fread(fileID, [2400, 2400], 'double');

fileID = fopen('./dpmap.bin');
dpmap = fread(fileID, [2400, 2400], 'double');

fileID = fopen('./rtmp.bin');
rtmp = fread(fileID, [135, 145], 'double');

trials = 10;
success = 0;

try
    XX = covert_search_dp(trials, dpmap, priorh, rtmp, 1, 0);
    success = 1;
end

if success
    display('Installation Successful!')
end

