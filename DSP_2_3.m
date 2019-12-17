clear; 
close all; 
clc;
Td=1; 
ap=0.5;as=50; 
wp=0.4*pi;ws=0.6*pi;
Wp=2/Td*tan(wp/2);Ws=2/Td*tan(ws/2); %��p����s 
[N,Wn]=buttord(Wp,Ws,ap,as,'s') %n:�˲�������, Wn:buttord�������Ȼ��ֹƵ��
[Bs,As]=butter(N,Wn,'s') 
%s=(2/Ts)(z-1)/(z+1) 
[Bz,Az]=bilinear(Bs,As,1/Td)
[H,W]=freqs(Bs,As);    
plot(W*Td/pi,20*(log10(abs(H))),'r+');hold on; %������ɢʱ��ϵͳ����������Ӧ
[H,w]=freqz(Bz,Az); 
plot(w/pi,20*(log10(abs(H))));grid on; %��������ʱ��ϵͳ����������Ӧ
% xlabel('��/pi(����)');ylabel('����(dB)');
% title('������˹��ͨ�˲���������Ӧ(blue:����,red:��ɢ)');
figure; 
[h,n]=impz(Bz,Az); 
stem(n,h);hold on; %���������˲���������Ӧ
g=tf(Bs,As);   
[h1,t]=impulse(g,[0:0.1:70]);
plot(t,h1,'r'); grid on;
% title('������˹��ͨ�˲���������Ӧ(blue:��ɢ,red:����)');

