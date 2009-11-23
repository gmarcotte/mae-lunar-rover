function [alpha beta gamma phi] = CalAngle(x, y, z)
%% x = forward distance from base of arm to rock surface
%% y = vertical distance from base of arm to rock surface
%% z = lateral distance from base of arm to rock surface

% alpha = inclination of neck-upperarm joint
% beta = bending down of upper-lower arm joint
% gamma = angle between lower arm and manipulator
% phi = yaw of anchor joint

% L = length of upper arm and lower arm
% N = length of neck
% R = distance from CG of manipulator to tip
% REF = 5 cm, specified in the problem

L = 40;
N = 10;
R = 7.5;
REF = 5;

radius = (x^2+z^2)^0.5;
xn = radius - N - R - REF;


beta = -180 + 2*asin((xn^2+y^2)^0.5/2/L)/pi*180
alpha1 = atan(y/xn);
alpha2 = acos((xn^2+y^2)^0.5/2/L);
alpha = (alpha1 + alpha2)/pi*180
gamma = (alpha2 - alpha1)/pi*180
phi = atan(z/x)
end