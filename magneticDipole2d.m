function [x,z,u,v] = magneticDipole2d(ur,d,q,R)
%-------------------------------------------------------------------------%
%                         INITIALIZATION                                  
%          Here, all the grid, size, charges, etc. are defined
%-------------------------------------------------------------------------%
% muo_0 = 4*pi*10^(-7);
% mou_r = ur
% Constant k = (mou_r*muo_0)/(4*pi) = 10^(-7)
% multiply q*d order factor k*10^(-9) for m of micro,nano order  
k = ur*10^(-7)*10^(-9);

% magnetic moment m = q*d
m = q*d;
%let R be distance between a selected point and the location of charge
%point have ranges 0 to R
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

end