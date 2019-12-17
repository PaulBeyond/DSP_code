clear;
N=8;
n1=0:3;
n2=0:5;
n3=0:N-1;
n4=0:8;
x1=[1 1 1 1];
for i=0:5
     x2(1,i+1)=cos(pi*i/4);
end
x11=fft(x1,N);
x22=fft(x2,N);
x33=x11.*x22;
x3=ifft(x33,N);
figure;

stem(n1,x1);
xlabel('x1[n]');
figure;
stem(n2,x2);
xlabel('x2[n]');
figure;
stem(n3,x3);
xlabel('x3[n]');
x4=conv(x1,x2)
figure;
stem(n4,x4);
xlabel('x4[n]');
for k=0:7 
    en(1,k+1)=x3(1,k+1)-x4(1,k+1);
end
en(1,9)=-x4(1,k+1);
figure;
stem(n4,en);
xlabel('e[n]');