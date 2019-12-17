clc;
clear;
close all;

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
figure(1);
subplot(1,3,1);plot(ts1,x1);
title('0.01');
subplot(1,3,2);plot(ts2,x2);
title('0.05');
subplot(1,3,3);plot(ts3,x3);
title('0.1');


%三次样条插值
tt=linspace(0,1,1001);
figure(2);
subplot(1,3,1);plot(ts1,x1);
title('x1n');
xtt1=spline(ts1,x1,tt);
subplot(1,3,2);plot(tt,xtt1);
title('x1t');
xa_r1 = x1 * sinc( 100 * ( ones(101,1) * t22 - ts1' * ones(1,length(t22))));
subplot(1,3,3);plot(t22,xa_r1);
title('sinc1');

figure(3);
subplot(1,3,1);plot(ts2,x2);
title('x2n');
xtt2=spline(ts2,x2,tt);
subplot(1,3,2);plot(tt,xtt2);
title('x2t');
xa_r2 = x2 * sinc( 20 * ( ones(21,1) * t22 - ts2' * ones(1,length(t22) )));
subplot(1,3,3);plot(t22,xa_r2);
title('sinc2');

figure(4);
subplot(1,3,1);plot(ts3,x3);
title('x3n');
xtt3=spline(ts3,x3,tt);
subplot(1,3,2);plot(tt,xtt3);
title('x3t');
xa_r3 = x3 * sinc( 10 * ( ones(11,1) * t22 - ts3' * ones(1,length(t22) )));
subplot(1,3,3);plot(t22,xa_r3);
title('sinc3');


