close all; 
[s1, fs1] = audioread('mic1.wav'); % reads file mic1.wav file.
[s2, fs2] = audioread('mic2.wav'); % reads mic2.wav file. 
[s,fs]    = audioread('cleanspeech.wav'); 
%sound(s1);
%sound(s2); 
%sound(s); 
mu = 0.0007; %step size
N = 128;     %size of the FFT
K = fix(length(s1)/N); %Number of frames
%%
d = ones(1, N); 
x = ones(1, N); 
B = zeros(N, 1); 
e = zeros(1, N); 
Xdiag = ones(N,N); 
e_total = zeros(length(s1), 1); 
E_db = zeros(1,K); 
B_plot = zeros(K,N/2);

for k=1:K %looping through the signal to clean it up
    n = (1:N)+(N*(k-1));
    d = s1(n);
    D = fft(d); 
    x = s2(n);
    X = fft(x); 
    Xdiag = diag(X); 

    E = D-Xdiag*B; %creating the error signal
    E_db(k) = 10*log10((E'*E)/N); %save the error calculation 
    B = B + 2*mu*Xdiag'*E; %adjust the filter coefficients
    B_plot(k,:) = abs(B(1:N/2).'); %save the filter coefficients
    e = ifft(E);    %Convert the error signal to time domain
    e_total(n) = e; %save the signal in the vector
end

plot(E_db);
ylabel('|E^2|')

figure;
mesh(10*log10(B_plot))
xlabel('Frequency')
ylabel('Iterations')
zlabel('dB')

denom1 = s-e_total;
denom2 = s-s1; 
SNRa=10*log10(((s'*s)/N)/((denom1'*denom1)/N))
SNRb=10*log10(((s'*s)/N)/((denom2'*denom2)/N))
SNRImp = SNRa - SNRb
%sound(e_total); 
