function [ PolinomLG ] = PolinomLver_1(ro,L1,p1,w0)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% x=[-500:1:500]*1e-3; %a row-vector of points for the x-axis % в метрах
% y=[-500:1:500]*1e-3; %a row-vector of points for the y-axis % в метрах
% [X Y]=meshgrid(x,y); % create matrices for grids of X and Y
% [phi,ro] = cart2pol(X,Y); %transform Cartesian coordinates to polar

%ПЕРЕМЕННЫЕ НАКАЧКА, РАДИАЛЬНЫЕ И АЗИМУТАЛЬНЫЕ ИНДЕКСЫ
% w0=0.001; % beam spot 

%; %топологический заряд или азимутальный инкес
% p1=0; %радиальный инкекс
% m=1;
PolinomLG=0;
% syms m
 for m=0 : p1
     
PolinomLG=PolinomLG+(-1)^m.*((factorial(abs(L1)+p1))./((factorial(p1-m))*(factorial(abs(L1)+m))*(factorial(m))))*(2*ro.^2/w0^2).^m; %полином Лаггера формула

% outputArg1 = inputArg1;
% outputArg2 = inputArg2;
end

