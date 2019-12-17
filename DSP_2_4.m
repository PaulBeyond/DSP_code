clear; 
close all; 
clc; 
ap=0.5;as=50; 
wp=0.4*pi;ws=0.6*pi;
[n,Wn]=buttord(wp,ws,ap,as,'s'); %n:�˲�������, Wn:buttord�������Ȼ��ֹƵ��
[B,A]=butter(n,Wn,'low','s');
[H,w]=freqs(B,A);    
plot(w/pi,20*(log10(abs(H)))); %���ƶ���������Ӧ
% xlabel('��/pi(����)');ylabel('����(dB)');
% title('������˹��ͨ�����˲���������Ӧ');
grid on;
figure;   
[h,n]=impz(B,A); 
stem(n,h); %�����˲���������Ӧ
% title('������˹��ͨ�����˲���������Ӧ');
grid on;
