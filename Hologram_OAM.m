clear all
close all
clc
x = -5000: 4 : 5000; % a row-vector of points for the x-axis
y = -5000: 4 : 5000; % a row-vector of points for the y-axis
[X,Y] = meshgrid(x,y); % create matrices for grids of X and Y
T_0 = 1;
alpha = 0.01; %amplitude of the phase modulation
l = 3; %topological charge
bigdelta = 1000; %controls the period of the grating (fringe spacing)
G = bigdelta;
[M,N] = size(X);
for m=1:M
for n=1:N
q = atan2(Y(m,n),X(m,n));
r = sqrt(Y(m,n)^2 + X(m,n)^2);
T(m,n) = T_0*exp(alpha*1i*cos(l*q - ((2*pi)/G)*r*cos(q)));
end
end
Treal = real(T);
temp_colormap = colormap('gray');
my_colormap = 1-temp_colormap;
pcolor(X,Y,Treal)%, axis('off')
title('Inversion');

colormap(my_colormap)
shading interp %(removes the grid)
figure();
pcolor(X,Y,Treal)%, axis('off')

colormap('gray')
shading interp %(removes the grid)
title('Original');