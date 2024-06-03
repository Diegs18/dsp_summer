close all; 

b =[-0.729 1.62 -1.8 1];
a =[1 -1.8 1.62 -0.729];

[z, p, g] = tf2zp(b, a);

disp("Zeros"); disp(z);
disp("Poles"); disp(p);
disp("Gain"); disp(g);

freqz(b, a);
title("Magnitude: Q1 Part 1")
figure; 
b =[1];
a =[1 0 0 0 0 -0.85];

[z, p, g] = tf2zp(b, a);

disp("Zeros"); disp(z);
disp("Poles"); disp(p);
disp("Gain"); disp(g);

freqz(b, a);
title("Magnitude: Q1 Part 2")