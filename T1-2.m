clc;
clear;
close all;

T=300;
W=0.1;
L=0.25;
n0=1*10^18;
a=0.1;
Dn=225;
s=100;
u_n=8500;
q=1.6*10^(-19);
E0=1;
d=0.01;
dx=2*W/s;
dy=L/s;
x=-W:dx:W;
y=0:dy:L;
[X,Y]=meshgrid(x,y);
E=0.5*E0*(1+cos(X/d));
n=n0*exp(-((X.^2+Y.^2)/(a^2)));
J_y_drift=q*E*u_n.*n;
[N_x,N_y]=gradient(n,dx,dy);
J_x=q*Dn*N_x;
J_y=q*Dn*N_y+J_y_drift;
J=sqrt((J_x.^2+J_y.^2));
figure
result1=quiver(x,y,J_x,J_y);
xlabel('x(cm)');
ylabel('y(cm)');
hold on;
contour(x,y,J);
figure
h=mesh(x,y,J);
xlabel('x(cm)');
ylabel('y(cm)');
zlabel('J(A/cm^2)');

