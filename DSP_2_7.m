clear; 
close all; 
clc;
wp=0.6*pi; ws=0.4*pi; 
Rp=0.5; As=60; 
wc=(wp+ws)/2;   
%���㴰��״����
A=-20*log10(min(1-10^(-Rp/20), 10^(-As/20))); 
if A<=21   
    beta=0 
elseif (A>21) & (A<=50) 
    beta=0.5842*(A-21).^0.4+0.07886*(A-21) 
else    beta=0.1102*(A-8.7) 
end
M=ceil((A-8)/(2.285*abs(wp-ws)));  %���㴰��
M=M+rem(M,2); %����ȡż��
h=fir1(M,wc/pi,'high',kaiser(M+1,beta));
n=0:M;  
stem(n,h); %����������Ӧ
axis([0,M,-0.5,1]);
%title('���󴰸�ͨ�˲���������Ӧ');
H=fft(h,512); 
figure;
k=0:511; 
subplot(1,2,1);  
plot(k/256,20*log10(abs(H))); %���Ʒ�����Ӧ
axis([0.4,0.7,-70,0]);  grid on;
ylabel('dB');
%title('���󴰸�ͨ�˲���������Ӧ');
subplot(2,2,2);  
plot(k/256,20*log10(abs(H))); 
axis([0.4,0.45,-70,-30]); grid on; %�Ŵ������ֹƵ��,�۲��Ƿ�������Ҫ��
subplot(2,2,4);  
plot(k/256,20*log10(abs(H))); %�Ŵ�ͨ����ֹƵ��,�۲��Ƿ�������Ҫ��
axis([0.55,0.65,-5,1]); grid on;

