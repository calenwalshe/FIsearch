# Foveated Ideal Searcher (FI) - v1.0

**News:** 
- v1.0 released!
- This toolbox is under active development. Stay tuned for updates and news.

## What is it

The Foveated Ideal Covert Searcher is a new method for searching for images added to scenes. Covert search performance is limited by both the prior probability over potential target locations (the position uncertainty), and the detectability of the target at all the potential target locations (the d' map). The FI searcher takes both of these into account to perform optimal visual search for a target. It is called a covert search because the position of the target relative to the foveated map is fixed.

Given a d' map and a prior probability distribution the FI search is approximately the optimal way to search for targets in large set of image backgrounds.

## Installation

[**Easy Install: Get a zip file**](https://github.com/calenwalshe/FIsearch/archive/master.zip).
- Unpack and navigate to directory, then run `test_install`

## Quick start

```Matlab
trials   = 200; % model converges with more trials
seed     = 1; % same seed same results
bGpu     = 0; % use a gpu
priorh   = fread('./priorh.bin', [2400, 2400], 'double');
dpmap    = fread('./dpmap.bin', [2400, 2400], 'double');
rtmp     = fread('./rtmp.bin', [135, 145], 'double');
results  = covert_search_dp(trials, dpmap, priorh, rtmp, seed, bGpu);
```

## How does it work

More to come. Stay tuned.

## Troubleshooting

If you have trouble doing something with BADS:

- Check out the FAQ on the [Foveated Ideal wiki](https://github.com/calenwalshe/FIsearch/wiki);
- Contact me at <calen.walshe@utexas.edu>, putting 'Foveated Ideal' in the subject of the email.

## BADS for other programming languages

There is an active project to make a version of the algorithm available in R. Stay tuned. 

## Reference

1. 

### License

BADS is released under the terms of the [GNU General Public License v3.0](https://github.com/calenwalshe/FIsearch/blob/master/LICENSE.txt).
