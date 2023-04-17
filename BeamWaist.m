clc
clear all

F = 18e-3; 
D = 5e-3;
n1 = 1;
n2 = 1; %��� 532
% n2 = 1.7; %��� 532
lambda = 650e-9;% � ������
% zR=1e-3;


theta = atan((D/2)/F);
% theta = (D/2)/F;
gamma = asin((sin(theta)*n1)/n2); 
phi = 2*gamma % ���� ������������ ��� ����������
w0 = 2*lambda/(pi*phi*n2); % ������ ��������� ����� � ������� ���������
zr = (pi*n2*w0^2)/lambda; %����� �����
% zr = (pi*w0^2)/lambda;
zrmm532 = zr*1e+3 % %����� ����� � mm
w0mkm532 = w0*1e+6 % ������ ��������� ����� mkm
w0signal = sqrt(2)*w0; %
w0signal =  w0signal*1e+6 %������ ��������� ����� ����������� ��� ��������� ����� � mkm


%::::::::::::::::::::::::��� 1400
F = 11e-3; 
D = 1e-3;
n1 = 1;
n2 = 1; %��� 1400
lambda = 1480e-9;
theta = atan((D/2)/F);
% theta = (D/2)/F;
gamma = asin((sin(theta)*n1)/n2);
phi = 2*gamma;
w0 = 2*lambda/(pi*phi);
zr = (pi*w0^2)/lambda;
zrmm1400 = zr*1e+3 % mm
w0mkm1400 = w0*1e+6 % mkm



%::::::::::::::::::::::::��� 860
F = 11e-3; %� ����������
D = 1e-3; %� ����������
%2 ��������� ������� ����� � 4 ����
%50 �� 200 ��

n1 = 1;
n2 = 1; %��� 860
lambda = 860e-9;
% zR=1e-3;

theta = atan((D/2)/F);
% theta = (D/2)/F;
gamma = asin((sin(theta)*n1)/n2);
phi = 2*gamma;
w0 = 2*lambda/(pi*phi);
zr = (pi*w0^2)/lambda;
zrmm860 = zr*1e+3 % mm
w0mkm860 = w0*1e+6 % mkm