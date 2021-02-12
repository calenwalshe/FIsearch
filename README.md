# Core visual search algorithm
```Matlab
fileID = fopen('./priorh.bin');
priorh = fread(fileID, [2400, 2400], 'double');
fileID = fopen('./dpmap.bin');
dpmap = fread(fileID, [2400, 2400], 'double');
fileID = fopen('./rtmp.bin');
```
