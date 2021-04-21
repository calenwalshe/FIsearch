# Foveated Ideal Searcher (FI) - v1.0

**News:** 
- v1.0 released!
- This toolbox is under active development. Stay tuned for updates and news.

## What is it

Covert search performance is limited by both the prior probability over potential target locations (the position uncertainty) and the detectability of the target at all the possible target locations (the d' map). The FI searcher takes both of these into account to perform optimal covert visual search for a target

## Installation

[**Easy Install: Get a zip file**](https://github.com/calenwalshe/FIsearch/blob/main/archive/master.zip).
- Unpack and navigate to directory, then run `test_install`

## Quick start

```Matlab
trials   = 200; % model converges with more trials
seed     = 1; % same seed same results
bGpu     = 0; % use a gpu
priorh   = fread(fopen('./priorh.bin'), [2400, 2400], 'double');
dpmap    = fread(fopen('./dpmap.bin'), [2400, 2400], 'double');
rtmp     = fread(fopen('./rtmp.bin'), [135, 145], 'double');
results  = covert_search_dp(trials, dpmap, priorh, rtmp, seed, bGpu);
```

## Help

If you have trouble doing something with FIsearch:

- Contact me at <calen.walshe@utexas.edu>, putting 'Foveated Ideal' in the subject of the email.
- Wiki coming soon...

## Ports to other languages

There is an active project to make a version of the algorithm available in R and Python. Follow that project [here](https://github.com/calenwalshe/visual_search_fast)

## Reference

R. Calen Walshe, Jared Abrams, Wilson Geisler; A theory of visual search for targets added to natural backgrounds. Journal of Vision 2020;20(11):404. doi: https://doi.org/10.1167/jov.20.11.404.

### License

FI is released under the terms of the [GNU General Public License v3.0](https://github.com/calenwalshe/FIsearch/blob/master/LICENSE.txt).

### Thanks and credits.

Thanks to the Giesler Lab for many various contributions. 

