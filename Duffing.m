function [outstate] = Duffing(instate, t)

%instate position 1 is the position
x = instate(1);
%instate position 2 is the velocity
v = instate(2);

outstate = zeros(1,2);
w = 1.2199778;
A = 4.0;
B = 0.154;
R = 0.11;

%output position 1 is the velocity
temp1 = v;

%output position 2 is the acceleration
temp2 = x - A * x ^ 3 - B * v + R * cos(w * t);

outstate = [temp1, temp2];

end
