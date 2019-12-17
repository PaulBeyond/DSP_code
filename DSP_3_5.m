clear;
xn = zeros(1,51);
for i=0:50
    xn(1,i+1)=sin(0.45*pi*i)*sin(0.55*pi*i);
end
X=fft(xn);
k=0:50;
h=abs(X);

figure;
kk=0:0.01:50;
hh=spline(k,h,kk);
plot(k,h,'.',kk,hh);


