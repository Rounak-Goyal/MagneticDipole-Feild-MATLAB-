function [a,b] = circle(x,z,r,c)
hold on
th = 0:pi/50:2*pi;
a = r * cos(th) + x;
b = r * sin(th) + z;
plot(a, b);
fill(a, b, c)
text(0, 3*r/4 , 'N', 'FontSize', 12, 'Color', 'g')
text(0, 0, '\^', 'FontSize', 12, 'Color', 'g')
text(0, 0, '|', 'FontSize', 12, 'Color', 'g')
text(0, -3*r/4 , 'S', 'FontSize', 12, 'Color', 'g')
hold off
axis equal
end