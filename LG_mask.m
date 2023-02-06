clc
close all
clear all

x=[-100:0.1:100]; %a row-vector of points for the x-axis % (in pixels)
y=[-100:0.1:100]; %a row
[X Y]=meshgrid(x,y); % create matrices for grids of X and Y
[phi,ro] = cart2pol(X,Y); %transform Cartesian coordinates to polar
p=0;


L11=1; %OAM of generation дл€ накачки


w0=50; % gaussian waist beam дл€ накачки 

V=11; %период диф. реш. в пиксел€х дл€ 1

LG11=LG(ro,phi,w0,L11,p);
Result_1=LG11;

PHASE_0=angle(Result_1);
PHASE_1=(angle(Result_1)-pi*abs(Result_1));
PHASE_2=mod(PHASE_1-2*pi*X/V,2*pi).*abs(Result_1);
PHASE_3=PHASE_2/max(max(PHASE_2));
PHASE_4=mod(PHASE_0-2*pi*X/V,2*pi);
% mesh(PHASE_1);set(gca,'view',[0 90]);colormap gray;

figure
colormap gray
mesh(X,Y,abs(PHASE_3));
set(gca,'view',[0 90]);

figure
colormap gray
mesh(X,Y,abs(PHASE_4));
set(gca,'view',[0 90]);

g=256;
map=[1:1:g;1:1:g;1:1:g]./256;
map=map';
f=256;
%imwrite(Result3.*f,map, 'Generate111.bmp');
imwrite(PHASE_3.*f,map, 'Compensation.bmp');
