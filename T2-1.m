clc;
clear;
close all;

T=1*10^(-5);
T_1=5*10^(-6);
T_2=10*10^(-6);
tp2=5*10^(-6);
up=368;
Dp=10;
dt=1*10^(-7);
E0=100;
a=1;

x1=(-a):(2*a*dt/T):0;
x2=(a*dt/T):(2*a*dt/T):a;
x3=(-5):(2*a*dt/T):(-a-(2*a*dt/T));
x4=(a+(2*a*dt/T)):(2*a*dt/T):5;
x=[x3 x1 x2 x4];
p1=x1+1;
p2=1-x2;
p3=zeros(1,(5-a-(2*a*dt/T))/(2*a*dt/T)+1);
p4=p3;
p=[p3 p1 p2 p4];
p0=p;
p_1=p;
p_2=p;

for t=0:dt:T_1
    temp1=diff(p_1,1,2);
    temp1(1,10/(2*a*dt/T)+1)=[0];
    temp2=diff(p_1,2,2);
    temp2(1,10/(2*a*dt/T):10/(2*a*dt/T)+1)=[0,0];
    D_p=-p_1/tp2-up*E0*temp1+Dp*temp2;
    p_1=p_1+D_p*dt;
end

for t=0:dt:T_2
    temp3=diff(p_2,1,2);
    temp3(1,10/(2*a*dt/T))=[0];
    temp4=diff(p_2,2,2);
    temp4(1,10/(2*a*dt/T):10/(2*a*dt/T)+1)=[0,0];
    D_p=-p_2/tp2-up*E0*temp1+Dp*temp2;
    p_2=p_2+D_p*dt;
end

plot(x,p_1);
hold on
plot(x,p_2);
hold on
plot(x,p0);
title('Q1');
xlabel('x/cm');

