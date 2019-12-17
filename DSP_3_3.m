clear;
m=5;
xm = zeros(1,50*m);

for j=0:m-1
for i=1:26
    xm(1,i+50*j)=(i+50*j-1)*exp(-0.3*(i+50*j-1));
end
end

Xm=fft(xm);
Xm=[Xm Xm];
km=0:(100*m-1);
hm=abs(Xm);
pham=angle(Xm);

figure;

stem(km,hm,'.');


figure;
stem(km,pham,'.');
