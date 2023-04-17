clc
clear all

F = 18e-3; 
D = 5e-3;
n1 = 1;
n2 = 1; %ДМС 532
% n2 = 1.7; %ДМС 532
lambda = 650e-9;% в метрах
% zR=1e-3;


theta = atan((D/2)/F);
% theta = (D/2)/F;
gamma = asin((sin(theta)*n1)/n2); 
phi = 2*gamma % угол расходимости или сходимости
w0 = 2*lambda/(pi*phi*n2); % ширина перетяжки пучка в области перетяжки
zr = (pi*n2*w0^2)/lambda; %длина релея
% zr = (pi*w0^2)/lambda;
zrmm532 = zr*1e+3 % %длина релея в mm
w0mkm532 = w0*1e+6 % ширина перетяжки пучка mkm
w0signal = sqrt(2)*w0; %
w0signal =  w0signal*1e+6 %ширина перетяжки пучка сигнального или холостого полей в mkm


%::::::::::::::::::::::::ДМС 1400
F = 11e-3; 
D = 1e-3;
n1 = 1;
n2 = 1; %ДМС 1400
lambda = 1480e-9;
theta = atan((D/2)/F);
% theta = (D/2)/F;
gamma = asin((sin(theta)*n1)/n2);
phi = 2*gamma;
w0 = 2*lambda/(pi*phi);
zr = (pi*w0^2)/lambda;
zrmm1400 = zr*1e+3 % mm
w0mkm1400 = w0*1e+6 % mkm



%::::::::::::::::::::::::ДМС 860
F = 11e-3; %Ч НЙМЙНЕФТБИ
D = 1e-3; %Ч НЙМЙНЕФТБИ
%2 НЙМЙНЕФТБ ЧИПДОПК РХЮПЛ Ч 4 ТБЪБ
%50 НН 200 НН

n1 = 1;
n2 = 1; %ДМС 860
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