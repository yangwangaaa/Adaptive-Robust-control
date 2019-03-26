close all;
clear all;


%Matrices A,B,C,D
a=[0 1;-25 -2];
b=[0;1];
c=[1 0];
d=0;

%Finding the poles and the transfer function
[n,d]=ss2tf(a,b,c,d);
sysTF=tf(n,d)           %Transfer Function
sysPoles=pole(sysTF)   %Poles

%Simulating system with unit step function for 10s
x0=[0;0];   %Initial conditions
t=0:0.01:10; %Total time of simulation
u=ones(length(t),1);    %Unit step function

plot(t,lsim(sysTF,u,t,x0))