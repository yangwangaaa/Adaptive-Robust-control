function AC=AC(t,s)

%The states of the plant
y=s(1);
ydot=s(2);

%The states of adaptive Controller
a1=s(3);
a2=s(4);

%The plant system matrices
a=[0 1;-25 -2];
b=[0;1];

%The unit step input
yd=5;
e=yd-y; %Error
edot=-ydot;
lam=4;      %Lamda
r=edot+lam*e;   %sliding error
wT=[a1 a2];     %The unknown weights
phi=[y;ydot];   %The regression matrix 
f=wT*phi;       
F=50;
dw=F*phi*transpose(r);  %Adapted Parameters
k=60;
v=f+k*r;
u=v+lam*edot;       %Input to the plant
dx= (a*phi)+(b*u);   %Output of the plant

AC=[dx;dw];

end