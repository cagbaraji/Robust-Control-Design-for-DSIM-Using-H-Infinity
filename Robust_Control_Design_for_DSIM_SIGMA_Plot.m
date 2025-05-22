% Sigma Plot Function for the DSIM Control Using H-Infinity Synthesis
s = tf('s');
s=tf('s');
A=[-1.6911 2.3058e-04 0.1 0 8.4545e-04 0; 8.4545e-04 -1.6911 0 0.1 8.4545e-04 0; -0.1 0 -1.6911 2.3058e-04 0 8.4545e-04; 0 -0.1 2.3058e-04 -1.6911 0 8.4545e-04; 4.8182e-04 4.8182e-04 0 0 -3.5351 -0.0966; 0 0 4.8182e-04 4.8182e-04 -0.0966 -3.5351];
B=[1; 0; 0; 0; 0; 0];
C=[1 0 0 0 0 0];
D=[0];
[nun,denun]=ss2tf(A,B,C,D);
G=tf(nun,denun);
G.u = 'u2';
G.y = 'y';
W1 = (5*s+20)/(s+0.01);
W1.u = 'y2';
W1.y = 'y11';
W2 = tf(0.1);
W2.u = 'u2';
W2.y = 'y12';
S = sumblk('y2 = u1 - y');
P = connect(G,S,W1,W2,{'u1','u2'},{'y11','y12','y2'});
[K,CL,GAM] = hinfsyn(P,1,1)
%Examine the resulting loop shape.
L = G*K;
S = inv(1+L);
T = 1-S;
sigmaplot(L,'k--',S,'g-x',T,'r');
legend('Open Loop Gain (L)','Sensitivity (S)','Complementary Sensitivity (T)')