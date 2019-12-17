clear;
x=[1 2 3 4 5 6 6 5 4 3 2 1];
X1=fft(x);
k1=0:11;
h1=abs(X1);
pha1=angle(X1);
figure;

stem(k1*2*pi/12,h1);

figure;
stem(k1*2*pi/12,pha1);


x=[1 2 3 4 5 6 6 5 4 3 2 1];
n=0:11;
w=linspace(0,12,10000000);
X2=x*exp(-j*n'*w);
h2=abs(X2);
pha2=angle(X2);
figure;plot(w,h2);

figure;
plot(w,pha2);


figure;
stem(k1*2*pi/12,h1);
hold on;
plot(w,h2);

figure;
stem(k1*2*pi/12,pha1);
hold on;
plot(w,pha2);


