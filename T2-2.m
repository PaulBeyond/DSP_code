clc;
clear;
close all;

T=1*10^(-5);
tp=5*10^(-6);
up=368;
Dp=10;
dt=1*10^(-7);
E1=100;
E2=200;
E3=500;
a=1;

x1=(-a):(2*a*dt/T):0;
x2=(a*dt/T):(2*a*dt/T):a;
x3=(-5):(2*a*dt/T):(-a-(2*a*dt/T));
x4=(a+(2*a*dt/T)):(2*a*dt/T):5;
x=[x3 x1 x2 x4];
p1=x1+1;
p2=1-x2;
p3=zeros(1,((5-a-(2*a*dt/T))/(2*a*dt/T))+1);
p4=p3;
p=[p3 p1 p2 p4];
p_result1=p;

for t=0:dt:T
    temp1=diff(p,1,2);
    for i=1:10/(2*a*dt/T)
    temp1(1,i+1)=temp1(1,i);
    end
    temp1(1,1)=[0];
    temp2=diff(p,2,2);
    for j=1:10/(2*a*dt/T)-1
    temp2(1,j+2)=temp2(1,j);
    end
    temp2(1,1:2)=[0,0];
    D_p=-p/tp-up*E3*temp1+Dp*temp2;
    p_1next=p+D_p*dt;
    p_result1=[p_result1;p_1next];
    p=p_1next;
end
t(1,T/dt+2)=T+dt;
figure
mesh(x,t,p_result1);

