clear; 
close all; 
clc;
Fs=8000;
fp=1500; fs=2000;
ap=3; as=40;
Td=1;
Wp=2*pi*fp/Fs/Td; Ws=2*pi*fs/Fs/Td;
[N,Wn]=cheb1ord(Wp,Ws,ap,as,'s') %n:�˲�������, Wn:��Ȼ��ֹƵ��
[Bs,As]=cheby1(N,ap,Wn,'low','s'); 
[Bz,Az]=impinvar(Bs,As,1/Td);
[r,p,k]=residue(Bz,Az);
[H,w]=freqz(Bz,Az);    
subplot(2,1,1);
plot(w/pi,20*(log10(abs(H)))); %�����˲�������������Ӧ
% xlabel('��/pi(����)');ylabel('����(dB)');
% title('�б�ѩ��һ�͵�ͨ�˲���������Ӧ');
subplot(2,1,2);
plot(w/pi,20*(log10(abs(H)))); 
axis([0,0.376,-4,0]); %�Ŵ�ͨ��ͼ�񣬹۲��Ƿ���ϲ���Ҫ��
figure;
[h,n]=impz(Bz,Az); 
stem(n,h);grid on; %�����˲���������Ӧ
axis([0,200,-0.15,0.3]);
% title('�б�ѩ��һ�͵�ͨ�˲���������Ӧ');



