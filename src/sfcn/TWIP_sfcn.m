function [sys,x0,str,ts] = TWIP_sfcn(t,x,u,flag)

switch flag
  case 0
    [sys,x0,str,ts]= mdlInitializeSizes; 

  case 1
    sys = mdlDerivatives(t,x,u); 
  case 3
    sys = mdlOutputs(t,x,u); 
    
  case { 2, 4, 9 } 
    sys = [];
  otherwise
    error(['Unhandled flag = ',num2str(flag)]); 
end

function [sys,x0,str,ts] = mdlInitializeSizes

sizes = simsizes;
sizes.NumContStates  = 6;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 6;
sizes.NumInputs      = 2;
sizes.DirFeedthrough = 0;     
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);

x0 = [0 0.3 0 0 0 0]';

str = [];

ts = [0 0];



function sys = mdlDerivatives(t,x,u)
M = 0.765;
m = 0.03;
l = 0.10;
d = 0.195;
r = 0.033;
Km=0.41202;

I2 = M*l^2/2; %Momen quan tinh cua than xe doi voi goc theta
I3 = M*(d^2)/2; %Momen quan tinh cua than xe doi voi goc phi
I1 = I3;

J = m*r^2/2; %Momen quan tinh cua banh xe theo truc cua banh
K = m*r^2/4; %Momen quan tinh cua banh xe voi truc thang dung

g = 9.81;
C = 0.005;

x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4); 
x5 = x(5);
x6 = x(6);

u1 = Km*u(1);
u2 = Km*u(2);

O1 = r^2*(M*l^2+I2)*((u1+u2)/r+2*C*(x5-x4/r)/r+M*l*sin(x2)*(x5^2+x6^2));
O2 = r^2*M*l*cos(x2)*(cos(x2)*sin(x2)*(I3-M*l^2-I1)*x6^2+(u1+u2)+2*C*(x5-x4/r)-M*l*g*sin(x2));
O3 = (2*J+(M+2*m)*r^2)*(cos(x2)*sin(x2)*(M*l^2+I1-I3)*x6^2-(u1+u2)-2*C*(x5-x4/r)+M*l*g*sin(x2));
O4 = -M*l*r^2*cos(x2)*((u1+u2)/r+2*C*(x5-x4/r)/r+M*l*sin(x2)*(x5^2+x6^2));
O5 = -2*r^2*(d*(u1-u2)/(2*r)+x6*sin(x2)*(M*l*x4+2*x5*cos(x2)*(M*l^2+I1-I3))+C*d^2*x6/(2*r^2));
O6 = r^2*(2*I3+4*K+m*d^2+2*(M*l^2+I1-I3)*(sin(x2))^2)+J*d^2;
O = (M*l*r)^2*(1-(cos(x2))^2)+2*I2*J+2*J*M*l^2+(I2*M+2*I2*m+2*M*m*l^2)*r^2;
%%%
sys(1) = x4; sys(2) = x5; sys(3) = x6;
sys(4) = (O1+O2)/O; sys(5) = (O3+O4)/O; sys(6) = O5/O6;


function sys = mdlOutputs(t,x,u)
sys = x;
