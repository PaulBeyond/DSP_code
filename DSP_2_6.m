clear; 
close all; 
clc;
M=ceil(8*pi/((0.4-0.3)*pi)); 
wc=[0.35  0.65];   
h=fir1(M,wc,'stop',hanning(M+1));
n=0:M;  
 
stem(n,h); %����������Ӧ
axis([0,M,-0.5,1]);
%title('�����������˲���������Ӧ');
H=fft(h,512); 
k=[0:511]; 
figure(2)   
plot(k/256,20*log10(abs(H))) %���Ʒ�����Ӧ 
axis([0.3,0.7,-50,0]); 
ylabel('dB');
%title('�����������˲���������Ӧ');
figure(3)
plot(k/256,20*log10(abs(H)))
ylabel('dB');
axis([0.3,0.7,-2,1]); grid on  %�Ŵ�ͨ����ֹƵ��,�۲��Ƿ�������Ҫ��

