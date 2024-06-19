close all; 
[s1, fs1] = audioread('mic1.wav'); % reads file mic1.wav file.
[s2, fs2] = audioread('mic2.wav'); % reads mic2.wav file. 
[s,fs]    = audioread('cleanspeech.wav'); 
%sound(s1);
%sound(s2); 

mu = 0.0005;
N = 256;
L = length(s1);
K = fix(L/N); 
B = zeros(L,1); 
%E = zeros(length(s1),1);
%e = zeros(length(s1),1);
for k = 1:K
    n = (1:N)+(N*(k-1));
    D  = fft(s1(n));
    X  = fft(s2(n)); 
    Xdiag = diag(X); 
    E     = D-Xdiag*B(n);
    EdB(k) = 10*log((E'*E)/10);
    B(n+1) = B(n) + 2*mu*Xdiag'*E; 
    e(n)   = ifft(E); 
end
plot(EdB);
ylabel('|E^2|')

figure;
%plot(B,)
denom1 = s-e;
denom2 = s-s1; 
SNRa=10*log10(((s'*s)/N)/((denom1'*denom1)/N))
SNRb=10*log10(((s'*s)/N)/((denom2'*denom2)/N))
SNRImp = SNRa - SNRb
%sound(real(e)); 