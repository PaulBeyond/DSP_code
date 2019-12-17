clear;
N=11;
M=101;
n=0:N-1;
m=0:N-1;

xn=cos(0.48*pi.*n)+cos(0.52*pi.*n);
kn=0:N-1;
wn=exp(-j*2*pi/N);
nk=n'*kn;
wnnk=wn.^nk;
xkn=xn*wnnk;

xm=cos(0.48*pi.*m)+cos(0.52*pi.*m);
km=0:M-1;
wm=exp(-j*2*pi/M);
mk=m'*km;
wmmk=wm.^mk;
xkm=xm*wmmk;


figure;

stem(kn,abs(xkn),'.');
  
figure;
stem(kn,angle(xkn),'.');
  
figure;
stem(km,abs(xkm),'.');
  
figure;
stem(km,angle(xkm),'.');
