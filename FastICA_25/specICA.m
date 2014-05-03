%% Pull in the song
clc;clear all
[X, fs] = wavread('data/Ani225.wav');
X = X';sound(X,fs);
%%
% X = resample(X',1,2);
% X = X';
% fs = fs/2;
sound(X,fs)
%% Transform the shit
wlen = 1024;
h = wlen/4;
nfft = wlen;

% perform time-frequency analysis and resynthesis of the original signal
[stft1, ~, ~] = stft(X(1,:), wlen, h, nfft, fs);
[stft2, f, t] = stft(X(2,:), wlen, h, nfft, fsa);
figure;
imagesc(abs(flipud(stft1)))
figure;
imagesc(abs(flipud(stft2)))
%%
sigs = fastica(abs(stft1));
% sigs = bsxfun(@rdivide,sigs,max(sigs,[],2));
%%
[x_istft, t_istft] = istft(stft, h, nfft, fs);
%%
i = 3
sound(sigs(i,:),fs)
%%
spectrogram(X(1,:))