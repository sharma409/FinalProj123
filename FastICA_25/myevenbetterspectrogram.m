function myevenbetterspectrogram(x,m,fs)

% x is a signal
% m is the block size
% fs is the sampling rate [Hz]

lx = length(x);
nt = ceil(lx/m);
xp = zeros(1,nt*m);
xp(1:lx) = x;
xm = [];

i=1;
while i <= m*nt-m+1
    xm = [xm xp(i:i+m-1).']; 
    i = i + m/2;
end

fl = [0:(m/2-1)]*fs/m;
tl = [1:2*nt-1]*m/(fs*2);

xwm = xm.*(hann(m)*ones(1,2*nt-1));
xwmf = fft(xwm);

sg_plot(tl,fl,xwmf(1:m/2,:))
