% this function tests Runge-Kutta with a harmonic oscillator
% Run it with RungeKutta(0.1, 10, [1,0], @Test) for a demo
function [Y] = Test(X, t)
    w = 1; Y = [w * X(2), -w * X(1)];
end
