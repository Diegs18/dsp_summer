close all;
fo = 200; % design frequency
fs = 8000; %sample frequency
wo = (2*pi)*(fo/fs); 
n = 10000; %number of samples
nn = 1:10000;
x = zeros(n, 1);
x(1) = 1; %create the delta function
h = cos(wo.*(1:n));
hnew = cos(wo*nn);
b = [1 -cos(wo)];
a = [1 -2*cos(wo) 1];

subplot(211);

freqz(b, a);
%plot the frequency response



%excite the system
%y = conv(h, x);
y = filter(b, a, hnew);
figure; 
spectrogram(y); %plot the specgram

%part e)
alpha = 0.01;
n2 = 1:10000;
wo2 = (2*pi)*n2.*(100+alpha.*n2);
y2 = cos(wo2);
%sound(y2)
figure;
spectrogram(y2)
title("Alpha = 0.01");
pause

alpha = 0.001;
n2 = 1:10000;
wo2 = (2*pi)*n2.*(100+alpha.*n2);
y2 = cos(wo2);
%sound(y2)
figure;
spectrogram(y2)
title("Alpha = 0.001");
