% Code to Determine the bode Function for the Dual Stator Machine
s=tf('s');

% The DSIM mathematical model is being converted from state space to transfer function
A=[-1.6911 2.3058e-04 0.1 0 8.4545e-04 0; 8.4545e-04 -1.6911 0 0.1 8.4545e-04 0; -0.1 0 -1.6911 2.3058e-04 0 8.4545e-04; 0 -0.1 2.3058e-04 -1.6911 0 8.4545e-04; 4.8182e-04 4.8182e-04 0 0 -3.5351 -0.0966; 0 0 4.8182e-04 4.8182e-04 -0.0966 -3.5351]
B=[1; 0; 0; 0; 0; 0]
C=[1 0 0 0 0 0]
D=[0]
[denun,nun]=ss2tf(A,B,C,D)

% Applying step function to evaluate the stability of existing DSIM model in frequency domain
G=tf(denun,nun)
bode(G)
