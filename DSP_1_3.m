clc;
clear;
close all;
n=linspace(0,100,101);

num=[4,3,2,1,2,3,4];
n2=1:6:1;
x_n=num(n2);
k=-200:200;
w=(pi/100)*k;
X=x_n*(exp(-j*pi/100)).^(n'*k);
magX=abs(X);
angX=angle(X);
figure;
subplot(1,2,1);plot(w,magX);
title('幅度曲线');
subplot(1,2,2);plot(w,angX);
title('相位曲线');


