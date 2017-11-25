close all;
clear all;
=
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
