clc;
clear;
close all;
n=linspace(0,100,101);
a=[1,2,0,1];
b=[1,-0.5,0.25,0];
figure(1);
zplane(a,b);
[h,t] = impz(a,b,n);
figure(2);
stem(t,h);
title('Impulse Response');
xlabel('n');ylabel('h(n)');
xn=5+3*cos(0.2*pi*n)+4*sin(0.6*pi*n);
figure(3);
plot(n,xn);
yn=filter(a,b,xn);
figure(4);
plot(n,yn)


