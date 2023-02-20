clear all
x=[-500:1:500]; %a row-vector of points for the x-axis % (in pixels)
y=[-500:1:500]; %a row-vector of points for the y-axis % (in pixels)

[X Y]=meshgrid(x,y); % create matrices for grids of X and Y
[phi,ro] = cart2pol(X,Y); %transform Cartesian coordinates to polar
% w=100;
% l=1;
p=0;
% res=LG(ro,phi,w,l,p);


L11=4; %OAM of generation для накачки 
L12=-4;
% L13=1;
% L14=3;


w0=200; % gaussian waist beam для накачки 

V=11; %период диф. реш. в пикселях для 1


LG11=LG(ro,phi,w0,L11,p);
LG12=LG(ro,phi,w0,L12,p);
% LG13=LG(ro,phi,w0,L13,p);
% LG14=LG(ro,phi,w0,L14,p);
% Result_1=(1/3)^0.5*LG11+(1/3)^0.5*LG12+(1/3)^0.5*LG13;
a=1;
b=1;
Result_1=(a)^0.5*LG11+(b)^0.5*LG12*exp(0i*pi);
PHASE_1=((atan2(imag(Result_1), real(Result_1)))-pi*abs(Result_1));
PHASE_1=mod(PHASE_1-2*pi*X/V,2*pi).*abs(Result_1);
PHASE_1=PHASE_1/max(max(PHASE_1));


%Построение итоговой интенсивности
Result_1=Result_1/max(max(Result_1));
figure
mesh(X,Y,abs(Result_1));
set(gca,'view',[0 90]);

%Построение итоговой маски
figure
mesh(X,Y,PHASE_1);
set(gca,'view',[0 90]);colormap gray;


%Сохранение файла на диск
g=256;
map=[1:1:g;1:1:g;1:1:g]./256;
map=map';
f=256;
imwrite(PHASE_1.*f,map, 'Compensation.bmp');
