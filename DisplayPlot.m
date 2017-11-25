close all;
clear all;

%SSN Generation
%*********************
% Fs=10000;
% t = 1/Fs:1/Fs:3200/(Fs);
% x = sin(2*pi*2000*t); % Create sawtooth signal.
% y = awgn(x,10,'measured'); % Add white Gaussian noise.
% y=y-x;
% % subplot(2,1,1);
% Y=fftshift(fft(y));
% l=length(y);
% f=-l/2:l/2-1;
% % plot(f*Fs/l,abs(Y));
% xlim([-8000 8000]);
% rp = 0.8;           % Passband ripple
% rs = 0.01;          % Stopband ripple
% f = [4000 4250];    % Cutoff frequencies
% a = [1 0];        % Desired amplitudes
% dev = [0.08 0.1];
% [n,fo,ao,w] = firpmord(f,a,dev,Fs);
% % subplot(2,1,2);
% b1 = firpm(n,fo,ao,w);
% y1=filter(b1,1,y);
% noise=y1';
% % subplot(2,1,2);
% Y1=fftshift(fft(y1));
% l1=length(y1);
% f1=-l1/2:l1/2-1;
% plot(f1*Fs/l1,abs(Y1));
% xlim([-8000 8000]);

[noise Fs]=audioread('sachanisrichasfuck.wav');
noise=noise(4000:7999);
%*********************
[x11 Fs]=audioread('ah_ae_0.wav');
[x21 Fs]=audioread('ah_ae_4.wav');
[x31 Fs]=audioread('ee_ah_0.wav');
[x41 Fs]=audioread('ee_ah_4.wav');
[x51 Fs]=audioread('ee_oo_0.wav');
[x12 Fs]=audioread('ee_oo_4.wav');
audio=[x11, x21, x31, x41, x51, x12];

    aaa=audio(:,4);
    x=decimate(aaa,10);

    SNR=30;
    rms_noise=rms(x)*10^(-0.05*SNR);
    noise=(rms_noise/rms(noise)).*noise;
    x_corrupted=x+noise;
    disp(20*log10(rms(x)/rms(noise)));
    sigs=[x,x_corrupted];
    % sound(x)
    % sound(x_corrupted)
    figure;
    hold on;
    t=1/Fs:1/Fs:length(x)/Fs;
    plot(t,x);
    plot(t,x_corrupted);
    xlabel('Time(s)');
    xlim([0.01 0.013])
    ylabel('Magnitude');
    title('Time Domain Signal');
    legend('Uncorrupted Signal','Signal at SNR = 5dB')


    Fs=Fs*0.1;
    f=linspace(0,Fs,length(x));
   
for i=1:2;
    x=sigs(:,i);
    y=fft(x);

    figure;
    semilogy(f,(abs(y)));
    xlabel('Frequency (Hz)');
    ylabel('Magnitude (dB)');
    hold;
    a=lpc(x,31);
    ak=a(2);
    bk=a(3);
    b=1;
    [h,w]=freqz(b,a,100);
    w=w*Fs/(2*pi); % w is assigned as formant frequency
    semilogy(w,(abs(h)));
     xlim([0 4000]);
    legend('Signal Spectrum','LPC Analysis');
        if i==1
            title('Uncorrupted Signal');
        else
            title('Corrupted Signal at 5 dB');
        end
end