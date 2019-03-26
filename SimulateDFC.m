clc;
clear all;
ini=[0;0;1;1];      %Initial Conditions
tin=0:0.1:10;       %Time of the simulation
[t,s]=ode45(@AC,tin,ini) %simulating the adaptive controller



plot(t,s(:,1))