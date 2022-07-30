function okay = checkHexagonal(points,radius)
%This function takes points in the complex plane and check if they are
%inside a hexagon of specified size (and a rotation with two sides being
%parallel to the horizontal axis. This function is used in the article:

%INPUT
%points = Matrix with points in the complex plane
%radius = Radius (length to corners) of the hexagon in the complex plane
%
%OUTPUT
%okay   = Matrix with booleans telling if the points are inside the hexagon

%Extract distances and angle
angles = angle(points);
distances = abs(points);

%Symmetry allows us to rotate all angles to lie in the area 0, pi/3
angles_modulus = mod(angles,pi/3);

%Extract the Cartesian coordinates for the rotated points
x = distances .* cos(angles_modulus);
y = distances .* sin(angles_modulus);

%Check if the points are in the hexagon, in an area limited by three lines
okay = (x<radius) & ( y<radius*(sqrt(3)/2)) & (x < radius - y/sqrt(3));