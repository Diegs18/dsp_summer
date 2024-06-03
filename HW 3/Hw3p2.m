close all; 
fs  = 10000;
fp  = 3000; 
fst = 4000; 
wp  = (2)*(fp/fs); 
wst = (2)*(fst/fs);
gp_db = 2; 
gst_db = 50; 
gp = 10^(gp_db/10); 
gst = 10^(gst_db/10); 
n = 256; 
%%
[m, wn] = buttord(wp, wst, gp_db, gst_db); 
[b, a]  = butter(m, wn); 
freqz(b, a);
title("Magnitude: Butterworth"); 
disp("Order of Butter worth"); disp(max(length(b), length(a)));
%%
figure
[m, wn] = cheb2ord(wp, wst, gp_db, gst_db); 
[b, a]  = cheby1(m, gp_db, wn);
freqz(b, a); 
title("Magnitude: Chebyshev1 ");
disp("Order of chebyshev"); disp(max(length(b), length(a)));

%%
figure
[m, wn] = ellipord(wp, wst, gp_db, gst_db); 
[b, a]  = ellip(m, gp_db, gst_db, wn); 
freqz(b, a); 
title("Magnitude: Elliptic ");
disp("Order of Elliptic"); disp(max(length(b), length(a)));


