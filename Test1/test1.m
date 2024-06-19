close all; 
b = [0 1];
a = [1 0 0.7];

impz(b, a) %calculate and plot the impulse response
 
figure; 
freqz(b, a) %cacluclate and plot the frequency response

b2 = [-.1811  -.1592 .09323 .25 .09323 -.1592 -.1811];
b3 = [-.04528 -.0796 .06992 .25 .06992 -.0796 -.04528];
a  = [1];

figure; 
freqz(b2, a)
title('Rectangular Window Frequency Response');

figure;
freqz(b3, a)
title('Triangular Window Frequency Response');