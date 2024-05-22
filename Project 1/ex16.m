function [s, fs, bits] = ex16(infile1, infile2, N)

% [s,fs,bits]=ex14(infile1,infile2)
%
% infile1, infile2 - .WAV input files
% N – frame size (in samples)
%
% s – signals loaded from infile1 and infile2
% fs – sample rates
% bits – bits per sample in each file
%
% Function loads infile1 and infile2, then displays
% records frame-by-frame. Computes average energy
% per sample in each file.

%% 
%%Load in the files 

[s1,fs1]=audioread(infile1);
info1 = audioinfo(infile1);
bits1 = info1.BitsPerSample;

[s2,fs2]=audioread(infile2);
info2 = audioinfo(infile2);
bits2 = info2.BitsPerSample;

l1 = length(s1);
l2 = length(s2); 
M  = min(l1, l2); 
K  = fix(M/N);
e  = s1 - s2;
e1 = (s1'*s1)/N;
denom = (e'*e)/N;
e2 = (s2'*s2)/N;

SNR = 10*log10(e1/denom)

for k = 1:K
        %Compute indices for current frame
        n = (1:N)+(N*(k-1));

        %signal 1
        subplot(211); 
        ax = gca;
        plot(ax, n, s1(n), 'b', n, e(n), 'g:');
        yline(ax, e1,'r-')
        msg = sprintf('%s Frame %d', infile1, k); 
        title(msg);
        msg = sprintf('Average power %d', e1); 
        text(n(1)+500.0, 0.4, msg);
        ylabel ('Normalized Amplitude'); 
        xlabel ('Sampled index');

        %signal 2
        subplot(212); 
        ax = gca;
        plot(ax, n, s2(n), 'b', n, e(n), 'g:');
        yline(ax, e2, 'r-')
        msg = sprintf('%s Frame %d', infile2, k); 
        title(msg);
        msg = sprintf('Average power %d', e2); 
        text(n(1)+500.0, 0.4, msg);
        ylabel ('Normalized Amplitude'); 
        xlabel ('Sampled index');
        
        %Pause between frames, waiting for keypress
        pause

end

s = [s1, s2];
fs = [fs1, fs2];
bits = [bits1, bits2];

