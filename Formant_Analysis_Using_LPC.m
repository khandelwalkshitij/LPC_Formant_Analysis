close all;
clear all;

[noise Fs]=audioread('sachanisrichasfuck.wav');
noise=noise(4000:7999);

[x11 fs]=audioread('/Dataset/ah_100.wav');
[x21 fs]=audioread('/Dataset/ae_100.wav');
[x31 fs]=audioread('/Dataset/ee_100.wav');
[x41 fs]=audioread('/Dataset/er_100.wav');
[x51 fs]=audioread('/Dataset/oo_100.wav');
[x12 fs]=audioread('/Dataset/ah_126.wav');
[x22 fs]=audioread('/Dataset/ae_126.wav');
[x32 fs]=audioread('/Dataset/ee_126.wav');
[x42 fs]=audioread('/Dataset/er_126.wav');
[x52 fs]=audioread('oo_126.wav');
disp(fs);
audio=[x11, x21, x31, x41, x51, x12, x22, x32, x42, x52];
audio_corrupted=zeros(4000,10);
audio_uncorrupted=zeros(4000,10);
for j=1:10
    a=audio(:,j);
    x=decimate(a,10);
    audio_uncorrupted(:,j)=x;
    SNR=5;
    rms_noise=rms(x)*10^(-0.05*SNR);
    noise=(rms_noise/rms(noise)).*noise;
    x_corrupted=x+noise;
    audio_corrupted(:,j)=x_corrupted;
end
    f=linspace(0,Fs,length(x));
    OUTPUT_lpc=zeros(18,9);
    for j=1:10;
    disp(j);
    a=lpc(audio_uncorrupted(:,j),15);
    b=1;
    [h,w]=freqz(b,a,100);
    w=w*Fs/(2*pi); % w is assigned as formant frequency           
    rts=roots(a);
    rts = rts(imag(rts)>=0);
    angz = atan2(imag(rts),real(rts));
    [frqs,indices] = sort(angz.*(Fs/(2*pi)));
    bw = -1/2*(Fs/(2*pi))*log(abs(rts(indices)));
    nn = 1;
    OUTPUT_lpc((j-1)*3+1,1:length(frqs))=frqs;
    OUTPUT_lpc((j-1)*3+2,1:length(bw))=bw;
    OUTPUT_lpc((j-1)*3+3,1:length(rts))=abs(rts);
    end 
