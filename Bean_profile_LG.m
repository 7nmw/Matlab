clc
close all
clear all

x=[-100:0.1:100]; %a row-vector of points for the x-axis % (in pixels)
y=[-100:0.1:100]; %a row-vector of points for the y-axis % (in pixels)

%========================================================================
L1=1; %OAM of generation
w0=60; % beam spot in pixels
V=5; %период диф. реш. в пикселях для 532
M=1;
%=====================================================================
p1=0; %радиальный инкекс
%========================================================================

[X Y]=meshgrid(x,y); % create matrices for grids of X and Y
[phi,ro] = cart2pol(X,Y); %transform Cartesian coordinates to polar

Amplitude=exp(-2*ro.^2/((w0)^2)).*(sqrt(2*factorial(p1)/(pi*(factorial(abs(L1)+p1))))).*((sqrt(2)*ro./w0).^abs(L1)).*PolinomLver_1(ro,L1,p1,w0); % амплитуда LG mode
Phase=(exp(-1i*L1.*phi)); % фаза LG mode
mesh(X,Y,Amplitude);
set(gca,'view',[0 90]);

