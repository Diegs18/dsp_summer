function [s, fs, bits] = ex17(infile1, infile2)

% [s,fs,bits]=ex14(infile1,infile2)
%
% infile1, infile2 - .WAV input files
%
% s – signals loaded from infile1 and infile2
% fs – sample rates
% bits – bits per sample in each file
%
% Function loads infile1 and infile2, then
% computes the difference between the signals
% and saves as .wav, then it computes the 
% summation and saves that as a .wav and then
% plays both difference signals and summation 
% signals back to the user.

%% 
%%Load in the files 

[s1,fs1]=audioread(infile1);
info1 = audioinfo(infile1);
bits1 = info1.BitsPerSample;

[s2,fs2]=audioread(infile2);
info2 = audioinfo(infile2);
bits2 = info2.BitsPerSample;

diff  = s1 - s2;
f1_name = 'grabled1.wav';
audiowrite(f1_name, diff, fs1)
sum   = s1 + s2;
f2_name = 'grabled2.wav';
audiowrite(f2_name, sum, fs2)

[s3,fs3]=audioread(f1_name); %difference signal
sound(s3, fs3)
%Pause between sound bytes, waiting for keypress
pause

[s4,fs4]=audioread(f2_name); %summation signal
sound(s4, fs4)
s = [s1, s2];
fs = [fs1, fs2];
bits = [bits1, bits2];

