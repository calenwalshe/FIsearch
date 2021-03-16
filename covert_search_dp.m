function results = covert_search_dp(trials, dpmap, priorh, rtmp, seed, bGpu)
% COVERT_SEARCH_DP Run the search algorithm with a few parameters as options.
% Most of the setup is precomputed in dpmap, priorh, and rtmp. See the paper (Walshe & Geisler, 2021)
% or other repos on github for details.

tic;
rng(seed)
%% Setup some generic parameters for size
sz      = 600; % in releases this can be variable size. 
rt      = floor(size(rtmp, 1)/2); 

lnepriorh       = log(priorh); % Create effective prior
half_dpmap      = 0.5 .* dpmap.^2;
half_dpmap_with_eprior = half_dpmap - lnepriorh;

tpaMat          = [zeros(floor(trials/2),1); ones(floor(trials/2),1)]; % 1 for target present, 0 for absent.
tpaMat          = tpaMat(randperm(length(tpaMat))); % permute isn't necessary becuase this search with no memory. we permute anyway.

N               = length(priorh(:)); % integer pixel locations
k               = randsample(N,trials,true,priorh(:));
[pre_yt,pre_xt] = ind2sub(size(priorh), k);

dataTotal = zeros(trials, 7);

expandMat = ones(4,4);
if bGpu
    dpmap                  = gpuArray(dpmap);
    half_dpmap_with_eprior = gpuArray(half_dpmap_with_eprior);
end

%% Run simulation loop
for k = 1:trials            % background number
    if bGpu
        bgNoiseA = randn(sz, sz, 1, 'gpuArray');
        re = kron(bgNoiseA, expandMat); 
    else
        re  = randn(sz); % human experiments have 30 independent pix per degree. upsample via nearest neighbor to run simulations in 120 pix per degree.
        re  = kron(re, expandMat); % Kronecker product is a sneaky way to increase the matrix with blocks
    end
    
    tpa = tpaMat(k);
    if tpa           % if target present add target responses
        xt = pre_xt(k);
        yt = pre_yt(k);
        re(yt-rt:yt+rt,xt-rt:xt+rt) = ...
            re(yt-rt:yt+rt,xt-rt:xt+rt) + abs(dpmap(yt-rt:yt+rt,xt-rt:xt+rt).*rtmp); % create the local target response
    else
        tpa = 0;
        xt  = 0;
        yt  = 0;
    end    
    
    % compute normalized responses
    % compute log likelihood ratio of target present,
    % location of max normalized response, and max normalized response
    norm_resp = re .* dpmap - half_dpmap_with_eprior;    
    slpmx     = max(norm_resp(:));
    [Y, X]    = find(norm_resp == max(norm_resp(:)), 1); % to use the max rule take the.... max. 

    % record data
    dataTotal(k, :) = [yt, xt, tpa, Y, X, slpmx];
end

%% Structured Data Storage
data     = dataTotal;
stimY    = data(:, 1);
stimX    = data(:, 2);
tPresent = data(:, 3);
ymax     = data(:, 4);
xmax     = data(:, 5);
slpmx    = data(:, 7);
trial    = (1:length(slpmx))';

toc;
results = table(trial, stimY, stimX, tPresent, ymax, xmax, slpmx,...
    'VariableNames', {'trial', 'stimY', 'stimX', 'tPresent', 'ymax', 'xmax', 'llr', 'slpmx'});
