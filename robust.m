function StateEstimate=robust(t,s)
%states for robust control
y=s(1);
ydot=s(2);
%The state matrices of the known plant
a=[0 1;-25 -2];
b=[0;1];
E=0.33; %Choosing value for epsilon

yd=5; %Unit step input
e=yd-y; %Error
edot=-ydot;
lam=8; %Lamda value
r=edot+lam*e; %The sliding error
wT=[1 20];    %The known weights
phi=[y;ydot];   %The regression matrix
f=wT*phi;       %Activation function
F=[1 50]*phi;

k=70;

%Under norm bound
if norm(r)<E
    v=-r*(F/E);
else
    v=-r*(F/norm(r));
end

tau=f+k*r-v;  %Plant Input    
u=tau+lam*edot;
dx= (a*phi)+(b*u); %Plant Output

StateEstimate=[dx(1);dx(2)];

end