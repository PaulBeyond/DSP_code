clc;
clear;
close all;

si = 11.9;
Dx =0.00000005;
a_n=0.000002;
a_p=0.000002;
An=10^15;
Ap=10^15;
Wi=0.000002:2*Dx:0.000006;
W=0.000002;
Vbi=zeros(1,41);
for k = 1:41
    %W = Wi(i);
    x_n=W/2;
    x_p=W/2;
    N=int32(W/Dx);
    num=(-W/2:Dx:W/2);
    N1=linspace(-W/2,-Dx,N/2);
    N2=linspace(Dx,W/2,N/2);
    px1=-1.6*10^(-19)*Ap*(exp(-N1./a_p)-1);
    px2=1.6*10^(-19)*An*(exp(N2./a_n)-1);
    Ex=zeros(1,(int32(W/Dx)+1));
    Ex(1,1:int32(W/(2*Dx)))=(1/si)*An*cumtrapz(N1,px1);
    Ex(1,int32(W/(2*Dx)+2):int32(W/(Dx)+1))=(1/si)*Ap*cumtrapz(N2,px2)+Ex(1,int32(W/(2*Dx)));
    phi=zeros(1,(int32(W/Dx)+1));
    for i = 2:(W/(Dx)+1)
       phi(i)=phi(i-1) - Ex(i-1)*Dx;
    end
    Vbi(k)=phi(int32(W/(Dx)));
    W=W+0.0000001;
end
figure(1);
plot(Wi,Vbi);
xlabel('W(cm)');ylabel('Vbi(V)');
