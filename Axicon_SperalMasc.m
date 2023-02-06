%Diffraction on Phase Masc

clc
close all
clear all
%Система координат
x=[-5:0.005:5]*1e-3; %метры 1e-3
y=[-5:0.005:5]*1e-3; %метры 1e-3
[X Y]=meshgrid(x,y);
[phi,r] = cart2pol(X,Y);

% Параметры
I_0=1; %начальная интенсивноть 
g=3*1e-3; % beam spot m
lyam=877e-9; % длинна волны метр;
j=0.2; % фокуссное растояние маски метр; 
l=1; % топологический заряд;
k=(2*pi)/lyam; %wavenumber;
r0=0.0004; % радиус окружности в плоскости фокусировки



Vax=exp(1i*(-k.*(r.^2)/2/j+k*r0.*r/j+l*phi)); %функция пропуская вехривого аксикона
Vsp=exp(1i*(-k.*(r.^2)/2/j+l*phi)); %функция пропускания спиральной пластинки с линзой
Vax=(atan2(imag(Vax),real(Vax)));
Vsp=(atan2(imag(Vsp),real(Vsp)));


% mesh(X,Y,(V)); set(gca,'view',[0 90]);grid on; %Построение маски
figure
mesh(X,Y,Vax); set(gca,'view',[0 90]);grid on; 
colormap gray %Построение маски
title('Вихревой Аксикон') %заголовок вверху графика
set(0,'DefaultAxesFontSize',14,'DefaultAxesFontName','Times New Roman');
set(0,'DefaultTextFontSize',14,'DefaultTextFontName','Times New Roman'); 
xlabel('X (m)') %подписи к Оси Ох 
ylabel('Y (m)') %подписи к Оси Оу

figure
mesh(X,Y,Vsp); set(gca,'view',[0 90]);grid on; 
colormap gray %Построение маски
title('Вихревая Линза') %заголовок вверху графика
set(0,'DefaultAxesFontSize',14,'DefaultAxesFontName','Times New Roman');
set(0,'DefaultTextFontSize',14,'DefaultTextFontName','Times New Roman'); 
xlabel('X (m)') %подписи к Оси Ох 
ylabel('Y (m)') %подписи к Оси Оу
