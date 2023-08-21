clc;
clear all;

M = 0.765; %Khoi luong cua phan than xe. Don vi: kg
m = 0.03; %Khoi luong cua banh xe. Don vi: kg
l = 0.10; %Khoang cach tu truc quay den trong tam cua xe. Don vi: m
d = 0.195; %chieu dai cua xe. Don vi: m
r = 0.033; %Ban kinh cua banh xe. Don vi: m

I2 = M*l^2/2; %Momen quan tinh cua than xe doi voi goc theta
I3 = M*(d^2)/2; %Momen quan tinh cua than xe doi voi goc phi
I1 = I3;

J = m*r^2/2; %Momen quan tinh cua banh xe theo truc cua banh
K = m*r^2/4; %Momen quan tinh cua banh xe voi truc thang dung

g = 9.81;
C = 0.005;
% Km = 0.41202; % Có ?i?u khi?n dòng
Km = 1;

Te = 20;
Ts = 0.001;
ct0 = Ts;
Lamda = 2*I2*J+2*J*M*l^2+I2*M*r^2+2*I2*m*r^2+2*M*l^2*m*r^2;
A = [ 0,     0,     0,     1,     0,     0;
      0,     0,     0,     0,     1,     0;
      0,     0,     0,     0,     0,     1;
      0, -(M*l*r)^2*g/Lamda, 0, -2*C*(M*l^2+I2+M*l*r)/Lamda, 2*C*r*(M*l*r+M*l^2+I2)/Lamda, 0;
      0, M*g*l*(2*J+M*r^2+2*m*r^2)/Lamda, 0, 2*C*(M*l*r+2*J+M*r^2+2*m*r^2)/(r*Lamda), -2*C*(2*J+M*r^2+2*m*r^2+M*l*r)/Lamda, 0;
      0, 0, 0, 0, 0, -(C*d^2)/(J*d^2+2*I3*r^2+4*K*r^2+d^2*m*r^2)];
b4 =  r*(M*l^2+I2+M*l*r)/Lamda; 
b5 = -(2*J+M*r^2+2*m*r^2+M*l*r)/Lamda;
b6 = -(d*r)/(J*d^2+2*I3*r^2+4*K*r^2+d^2*m*r^2);
  B = [  0,     0;
       0,     0;
       0,     0;
       b4, b4;
       b5, b5;
       b6, -b6];
 Q = [1.5 0 0 0 0 0;0 0.5 0 0 0 0;0 0 1 0 0 0;0 0 0 3.0 0 0;0 0 0 0 1/4 0;0 0 0 0 0 1/2];
 R = [1 0;0 1];
 R1= [10 0;0 10];
 R2 = [0.01 0;0 0.01];
 KK7 = lqr(A,B,Q,R);
 