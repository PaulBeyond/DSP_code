clc;
clear;
close all;


for i = 1:101:1
    wt(i)=(rand(1,1)-0.5)*2;
end
n=linspace(0,100,101);
yt=10*cos(0.0008*pi*n.^2)+wt;
figure;
plot(n,yt);

