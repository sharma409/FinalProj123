function sg_plot(tl,fl,y,dbf)
%
% function sg_plot(tl,fl,y,dbf)
%
% Plot an image of the spectrogram y, with the axis labeled with time tl,
% and frequency fl
%
% tl -- time axis label, nt samples
% fl -- frequency axis label, nf samples
% y -- spectrogram, nf by nt array
%
% find the maximum

if nargin<4
    dbf = 60;
end

mx = max(max(abs(y)));
% compute 20*log magnitude, scaled to the max
yl = 20*log10(abs(y/mx)+eps);


image(tl,fl,256*(yl+dbf)/dbf); axis xy; colormap(gray(256));
xlabel('Time, s');
ylabel('Frequency, Hz');