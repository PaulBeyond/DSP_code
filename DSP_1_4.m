clc;
clear;
close all;
n22=0:200;
xn22=5+10*(-1).^n22;
a22=[1,0,1,0,1,0,1];
b22=[1,0,0.81,0,0.81^2,0,0.81^3];
yn22=filter(a22,b22,xn22);
figure;
plot(n22,yn22,'.');

