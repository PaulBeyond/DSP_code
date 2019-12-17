clear;
x1 = zeros(1,50);
for i=1:26
    x1(1,i)=(i-1)*exp(-0.3*(i-1));
end
X1=fft(x1);
X1=[X1 X1];
k1=0:99;
h1=abs(X1);
pha1=angle(X1);

x2 = zeros(1,100);
for i=1:26
    x2(1,i)=(i-1)*exp(-0.3*(i-1));
end
X2=fft(x2);
X2=[X2 X2];
k2=0:199;
h2=abs(X2);
pha2=angle(X2);

figure;

stem(k1,h1,'.');

figure;
stem(k1,pha1,'.');
figure;
stem(k2,h2,'.');

figure;
stem(k2,pha2,'.');
