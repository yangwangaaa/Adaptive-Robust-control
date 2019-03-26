clc;
clear all;
ini=[0;0];  %Initial conditions for robust controller
[t,s]=ode45(@robust,[0:0.1:10],ini) %Simulating robust controller



plot(t,s(:,1))