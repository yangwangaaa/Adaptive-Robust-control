a=[0 1;-25 -2];
b=[0;1];
c=[1 0];
d=[];
sys=ss(a,b,c,d)
t=ss2tf(sys)
p=poles