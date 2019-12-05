clc;
clear;
close all;

si=11.9  %取硅的介电常数为11.9
Dx =0.00000001;
x_n=0.0000041;
x_p=0.0000056;
a_n=0.000002;
a_p=0.000003;
An=10^15;

N=(x_n+x_p)/Dx;
num=(-560:410)*Dx;
N1=(-560:-1)*Dx;
N2=(1:410)*Dx;
px1=-1.6*10^(-19)*(exp(-N1./a_p)-1);
px2=1.6*10^(-19)*An*(exp(N2./a_n)-1);
Ex=zeros(1,971);
Ex(1,1:560)=(1/si)*cumtrapz(N1,px1);
Ex(1,562:971)=(1/si)*cumtrapz(N2,px2);
Ap=-Ex(971)/Ex(560);
Ex(1,1:560)=Ex(1,1:560)*Ap;
Ex(1,562:971)=Ex(1,562:971)+Ex(560);
figure(1);
plot(num,Ex);
xlabel('x(m)');ylabel('E(V/m)');
phi=zeros(1,971);
for i = 2:971
   phi(i)=phi(i-1) - Ex(i-1)*Dx;
end
figure(2)
plot(num,phi);
xlabel('x(cm)');ylabel('phi(V)');


