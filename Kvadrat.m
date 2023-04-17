clc
close all
clear all
%Система координат
x=[-7:0.009:7]*1e-3; 
y=[-7:0.009:7]*1e-3; 
[X Y]=meshgrid(x,y);
[phi,r] = cart2pol(X,Y);

% x1=[-9:0.009:9]*1e-3; 
% y1=[-9:0.009:9]*1e-3; 
% [X1 Y1]=meshgrid(x1,y1);

%Параметры
I_0=1; %начальная интенсивноть 
g=3*1e-3; % beam spot m
lyam=532e-9; % длинна волны m; 
j=1; % фокуссное растояние маски m; 
l=1; % топологический заряд; 
k=(2*pi)/lyam; %wavenumber; 
z=0.1; % расстояние 



I=I_0*exp((-(X.^2+Y.^2))/(2*(g^2))); %функция гаусс пучка 
figure
mesh(X,Y,(I.*conj(I))); set(gca,'view',[0 90]);grid on;
% A = exp((X).^2+(Y).^2)/60; %Circular aperture

%Одно квадратное отвертие
% [X1 Y1] = meshgrid[-7:0.009:7]*1e-3;
% phi=1;
% r=[0 : 2*pi];
% A=-sqrt(phi.^2+r.^2)/10;
A=zeros(length(x),length(y));
B=ones(20,20);
A(750:769,750:769)=B;
% A1=zeros(length(x),length(y)); %Два квадратное отвертие
% B1=ones(10,10);
% A1(780:789,780:789)=B1;
% A=A1+A;
figure
mesh(X,Y,A);set(gca,'view',[0 90]);grid on;



%Дифракция Френеля с Фурье
E=(exp(-1i*k*z))/1i*lyam*z;
U=I.*A;
FurieU=U*(exp((-1i*k/2*z)*((X-X)^2+(Y-Y)^2)));
FurieU1=fftshift(ifft2(U));
Utog=FurieU1*E;
Utog=Utog.*conj(Utog);
figure
mesh(X,Y,Utog); set(gca,'view',[0 90]);grid on;

% Дифракция Фраунгофера
% X1=7*1e-3;
% Y1=7*1e-3;
% E=(exp(1i*k.*z)).*exp(1i*k*(X^2+Y^2)/2*z);
% U=I.*A;
% FurieU=U.*exp((-1i*2*pi*(X.*X1+Y.*Y1)/lyam*z));
% FurieU1=fftshift(ifft2(FurieU));
% Utog=FurieU1.*E;
% figure
% mesh(X,Y,abs(Utog)^2); set(gca,'view',[0 90]);grid on;
% 
% E=(exp(1i*k.*z)).*exp(1i*k*(X^2+Y^2)/2*z);
% U=I.*A;
% FurieU=U.*exp((-1i*2*pi*(X.*X+Y.*Y)/lyam*z));
% FurieU1=integral2(FurieU,x);
% Utog=FurieU1.*E;
% figure
% mesh(X,Y,abs(Utog)^2); set(gca,'view',[0 90]);grid on;


% mesh(X,Y,(Utog.*conj(Utog))); set(gca,'view',[0 90]);grid on;
% Utog2=atan2(imag(Utog),real(Utog));
% figure
% mesh(X,Y,(Utog2)); set(gca,'view',[0 90]);grid on;
