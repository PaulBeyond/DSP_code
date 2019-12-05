clc;
clear;
close all;
wt=zeros(1,101);

%%
%题1.d
for i = 1:101:1
    wt(i)=(rand(1,1)-0.5)*2;
end
n=linspace(0,100,101);
yt=10*cos(0.0008*pi*n.^2)+wt;
figure(1);
plot(n,yt);

%%
%题11
a=[1,2,0,1];
b=[1,-0.5,0.25,0];
figure(2);
zplane(a,b);
[h,t] = impz(a,b,n);
figure(3);
stem(t,h);
title('Impulse Response');
xlabel('n');ylabel('h(n)');
xn=5+3*cos(0.2*pi*n)+4*sin(0.6*pi*n);
figure(4);
plot(n,xn);
yn=filter(a,b,xn);
figure(5);
plot(n,yn)

%%
%题13.c
num=[4,3,2,1,2,3,4];
n2=1:6:1;
x_n=num(n2);
k=-200:200;
w=(pi/100)*k;
X=x_n*(exp(-j*pi/100)).^(n'*k);
magX=abs(X);
angX=angle(X);
figure(6);
subplot(1,2,1);plot(w,magX);
title('幅度曲线');
subplot(1,2,2);plot(w,angX);
title('相位曲线');

%%
%题22.a
n22=0:200;
xn22=5+10*(-1).^n22;
a22=[1,0,1,0,1,0,1];
b22=[1,0,0.81,0,0.81^2,0,0.81^3];
yn22=filter(a,b,xn22);
figure(11);
plot(n22,yn22,'.');


%%
%题24.a.c
Dt = 0.00005;
t22 = 0:Dt:1;
xa = sin(20*pi*t22);
nn=linspace(0,100,101);
ts1=linspace(0,1,101);
ts2=linspace(0,1,21);
ts3=linspace(0,1,11);
x1=sin(20*pi*ts1);
x2=sin(20*pi*ts2);
x3=sin(20*pi*ts3);
figure(7);
subplot(1,3,1);plot(ts1,x1);
title('0.01');
subplot(1,3,2);plot(ts2,x2);
title('0.05');
subplot(1,3,3);plot(ts3,x3);
title('0.1');


%三次样条插值
tt=linspace(0,1,1001);
figure(8);
subplot(1,3,1);plot(ts1,x1);
title('x1n');
xtt1=spline(ts1,x1,tt);
subplot(1,3,2);plot(tt,xtt1);
title('x1t');
xa_r1 = x1 * sinc( 100 * ( ones(101,1) * t22 - ts1' * ones(1,length(t22))));
subplot(1,3,3);plot(t22,xa_r1);
title('sinc1');

figure(9);
subplot(1,3,1);plot(ts2,x2);
title('x2n');
xtt2=spline(ts2,x2,tt);
subplot(1,3,2);plot(tt,xtt2);
title('x2t');
xa_r2 = x2 * sinc( 20 * ( ones(21,1) * t22 - ts2' * ones(1,length(t22) )));
subplot(1,3,3);plot(t22,xa_r2);
title('sinc2');

figure(10);
subplot(1,3,1);plot(ts3,x3);
title('x3n');
xtt3=spline(ts3,x3,tt);
subplot(1,3,2);plot(tt,xtt3);
title('x3t');
xa_r3 = x3 * sinc( 10 * ( ones(11,1) * t22 - ts3' * ones(1,length(t22) )));
subplot(1,3,3);plot(t22,xa_r3);
title('sinc3');
