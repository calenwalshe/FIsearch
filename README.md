# Core visual search algorithm

We are 

```Matlab
trials   = 200; % model converges with more trials
seed     = 1; % same seed same results
bGpu     = 0; % use a gpu
priorh   = fread('./priorh.bin', [2400, 2400], 'double');
dpmap    = fread('./dpmap.bin', [2400, 2400], 'double');
rtmp     = fread('./rtmp.bin', [135, 145], 'double');
results  = covert_search_dp(trials, dpmap, priorh, rtmp, seed, bGpu);
```
