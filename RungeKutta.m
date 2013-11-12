%General RungeKutta method

function varargout = RungeKutta(deltat, tott, x, y, z, varargin)
%RungeKutta is a generic RungeKutta procedure.
%The format is: {ending position} = RungeKutta(timestep, total time,
%initial x position, initial y position, initial z position, differential
%equations.
%Note: There must be three values for position, and differential equations
%which have inputs in the following format: (x, y, z, t)
%Yes, you do need all variables, even if they are not used.

xstore = input('What function is used to find x? (0 if x is not found) ');
ystore = input('What function is used to find y? (0 if y is not found) ');
zstore = input('What function is used to find z? (0 if z is not found) ');
if xstore 
    allx = zeros(1, tott / deltat);
end
if ystore
    ally = zeros(1, tott / deltat);
end
if zstore
    allz = zeros(1, tott / deltat);
end
for t = 0: deltat: tott 
    for i = 1: nargin
        func = varargin{i};
        k1 = func(x, y, z, t) * deltat;
        k2 = func((x + .5 * k1), (y + .5 * k1), (z + .5 * k1), (t + .5 * deltat)) * deltat;
        k3 = func((x + .5 * k2), (y + .5 * k2), (z + .5 * k2), (t + .5 * deltat)) * deltat;
        k4 = func((x + k3), (y + k3), (z + k3), (t + deltat)) * deltat;
        if i == xstore
            x = x + (1/6) * k1 + (1/3) * k2 + (1/3) * k3 + (1/6) * k4;
        end
        if i == ystore
            y = y + (1/6) * k1 + (1/3) * k2 + (1/3) * k3 + (1/6) * k4;
        end
        if i == zstore
            z = z + (1/6) * k1 + (1/3) * k2 + (1/3) * k3 + (1/6) * k4;
        end
        allx(i) = x;
        ally(i) = y;
        allz(i) = z;
    end
end
end