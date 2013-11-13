%General RungeKutta method

%F is a __function handle__ of type [position vector], time -> [velocity vector]
%RungeKutta is a generic RungeKutta procedure
%It takes a timestep, a total running time, an initial position [row vector]
%and the function to be integrated, and it returns a matrix where each row
%represents a point at a given time, with the first length(X) elements
%expressing the position, and the last element expressing the time. 

function [allPoints] = RungeKutta(deltat, tott, X, F)

allPoints = zeros(0,0);

for t = 0: deltat: tott 
    k1 = F(X, t) * deltat;
    k2 = F(X .+ .5 * k1, t + .5 * deltat) * deltat; 
    k3 = F(X .+ .5 * k2, t + .5 * deltat) * deltat;
    k4 = F(X .+ k3, t + deltat) * deltat;
    X = X + (1/6) * k1 + (1/3) * k2 + (1/3) * k3 + (1/6) * k4;
    allPoints = [allPoints; [X, t]];
end

end
