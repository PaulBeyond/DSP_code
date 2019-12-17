clear; 
close all; 
clc;
wp=[0.4*pi 0.5*pi]; 
ws=[0.3*pi 0.6*pi];  
Rp=0.5; As=50; 
[N,Wc]=cheb2ord(wp,ws,Rp,As,'s');
[B,A]=cheby2(N,As,Wc,'s');
[H,w]=freqs(B,A);
plot(w/pi,20*(log10(abs(H))));
% xlabel('��/pi(����)');ylabel('����(dB)');
% title('�б�ѩ����ʹ�ͨ�����˲���������Ӧ');
figure;   
[h,n]=impz(B,A); 
stem(n,h); 
% title('�б�ѩ����ʹ�ͨ�����˲���������Ӧ');