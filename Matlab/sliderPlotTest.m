close all
clear
clc

pi=sym(pi);                                                         % Acurate pi
syms theta1 theta2 theta3 theta4;                                   % for symbolic calulations

physicalProportions;

n=5;                                                                % 4dof + extra end-efector
m=6;                                                                % Antall posisjoner tegnet
height = baseHeight;

d = [60.8 0 0 0 0];                                                 % z-offset
%theta = [theta1 theta2 theta3 theta4 pi/6];                         % Actuator angles

theta1 = linspace(0,0,m);
theta2 = linspace(0,0,m);
theta3 = linspace(0,0,m);
theta4 = linspace(0,45*pi/180,m);
theta5 = linspace(pi/6,pi/6,m);                                     % Alwaya a constant pi/6

theta = [theta1' theta2' theta3' theta4' theta5'];                       % Actuator angles
a = [73 femurLength tibiaLength tarsalLength phalangesLength-24];   % x-offset Endefector defined 24mm above surface
alpha = [-pi/2 0 0 0 0];                                            % Dreining om x-akse
type = ["rot" "rot" "rot" "rot" "rot"];

for i = 1:m
    A = symCalcA(a, alpha, d, theta(i,:), n);
    T = symCalcT(A,n);
    H(:,:,:,i) = T;
end

printRobotSlider(H, n, m, height);






%%
close all
clc
slider_plot(m)
