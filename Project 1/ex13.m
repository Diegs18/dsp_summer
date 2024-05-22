function [s,fs, bits] = ex13(infile, playstate)
%infile - .wavinput file
% playstate – Switch playback on/off
%
% s – signal loaded from infile
% fs – sample rate
% bits – bits per sample
%
% Function loads infile, displays entire
% record, then optionally plays back the
% sound depending upon state of playstate


%%Load Infile
[s,fs]=audioread(infile);
info = audioinfo(infile);
bits = info.BitsPerSample;

%%Display infile 
plot(s, 'r:')

%%Playback infile if playstate is set
if playstate == 1
    sound(s, fs);
end