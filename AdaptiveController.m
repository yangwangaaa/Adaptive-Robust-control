function AC=AC(t,s)
y=s(1);
ydot=s(2);
a1=s(3);
a2=s(4);
a=[0 1;-25 -2];
b=[0;1];


yd=5;
e=yd-y;
edot=-ydot;
lam=4;
r=edot+lam*e;
wT=[a1 a2];
phi=[y;ydot];
f=wT*phi;
F=50;
dw=F*phi*transpose(r);
k=10;
v=f+k*r;
u=v+lam*edot;
dx= (a*phi)+(b*u);

AC=[dx(1);dx(2);dw(1);dw(2)];

end