%-------------------------------------------------------------------------%
%This program computes the Magnetic Fields due to dipole in a 2D plane x-z 
%-------------------------------------------------------------------------%
clc
close all; 
%-------------------------------------------------------------------------%
%                   SYMBOLS USED IN THIS CODE                             
%-------------------------------------------------------------------------%
% B = Total magnetic field B(x,z)
% Bx = X-Component of magnetic-Field Bx(r) =(µ0/4pi)m*[(3xz)/r^5]
% Bz = z-Component of magnetic-Field Bz(r) =(µ0/4pi)m*[[(3z^2)-(r^2)]/r^5]
% d = distance between charges
% q = value of magnetic charge
% m = magnetic charge moment m = q*d
% ur = Relative permeability
% r = distance between a selected point and the location of charge
%-------------------------------------------------------------------------%
%-------------------------------------------------------------------------%
%                         INITIALIZATION                                  
%          Here, all the grid, size, charges, etc. are defined
%-------------------------------------------------------------------------%
% muo_0 = 4*pi*10^(-7);
% mou_r = ur
% Constant k = (mou_r*muo_0)/(4*pi) = 10^(-7)
% multiply q*d order factor k*10^(-9) for m of micro,nano order  
ur = 1;
k = ur*10^(-7)*10^(-9);

% magnetic moment m = q*d
q = 1;
d = 2;
m = q*d;
%let R be distance between a selected point and the location of charge
%point have ranges 0 to R
R = 100;
%creating equaly spaced vectors x
x = linspace(-R,R,R/2);
z = x;
%creating grid
[xx,zz] = meshgrid(x,z);


%-------------------------------------------------------------------------%
%                   COMPUTATION OF MAGNETIC FIELDS                        %
%-------------------------------------------------------------------------%

% r = distance between a selected point and the location of charge
rr = sqrt(xx.^2 + zz.^2);

% Bx = X-Component of magnetic-Field Bx(r) =(µ0/4pi)m*[(3xz)/r^5]
Bx = k*m .* (3.*xx.*zz)./(rr.^5);
% Bz = z-Component of magnetic-Field Bz(r) =(µ0/4pi)m*[[(3z^2)-(r^2)]/r^5]
Bz = k*m .* (3.*zz.^2./rr.^5 - 1./rr.^3);

% B = Total magnetic field B(x,z)
B = sqrt(Bx.^2 + Bz.^2);

u = Bx./B;
v = Bz./B;

%-------------------------------------------------------------------------%
%                       PLOT THE RESULT                                   %
%-------------------------------------------------------------------------%
figure;
    %vector plot by quiver
    h = quiver(x,z,u,v,'autoscalefactor',1);
    set(h,'color','b','linewidth',1);
    %stremslice plot by streamslice
    l = streamslice(x,z,u,v);
    set(l,'Color','r','LineWidth',1);
    axis tight
    circleout = circle(0, 0, d/2, 'r');
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
%-------------------------------------------------------------------------%
%                       FUNCTIONS USED                                    %
%-------------------------------------------------------------------------%      
function circles = circle(x,z,r,c)
hold on
th = 0:pi/50:2*pi;
x_circle = r * cos(th) + x;
z_circle = r * sin(th) + z;
circles = plot(x_circle, z_circle);
fill(x_circle, z_circle, c)
text(0, 3*r/4 , 'N', 'FontSize', 12, 'Color', 'g')
text(0, 0, '\^', 'FontSize', 12, 'Color', 'g')
text(0, 0, '|', 'FontSize', 12, 'Color', 'g')
text(0, -3*r/4 , 'S', 'FontSize', 12, 'Color', 'g')
hold off
axis equal
end
