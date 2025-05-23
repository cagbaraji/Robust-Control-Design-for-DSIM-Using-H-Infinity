# Robust-Control-Design-for-DSIM-Using-H-Infinity
The Dual Stator Induction Motor (DSIM) has been used in many applications especially where reliability, high torque density and fault tolerance are required such as:
Industrial automation
Wind turbines
Electrical propulsion systems such as aerospace, naval vessels

## Critical Challenges of DSIM
i. Sensitivity to disturbance 
The DSIM suffers from high sensitivity to disturbances i.e., low frequency oscillation or vibration because it has complex magnetic coupling and high control dependencies.
As a result, small input disturbances into the machine can lead to non-linear behaviours.

ii. Poor Trajectory Tracking:
DSIM records poor trajectory tracking, i.e., error or difference between the desired output and actual output.

Therefore, DSIM requires a robust control design in order to prevent trajectory tracking degradation due to:

•	Non-linearities between the stators,

•	Cross-coupling effects,

•	and mismatch of parameters

## Materials and Methodology

This study designs a controller for a DSIM using H-infinity and the Multivariable Linear Time-Invariant (LTI) system was modeled using state-space representation. The DSIM system dynamics were defined by matrices A, B, C, and D, which represents a six-state plant. The DSIM state space model representation was converted into its equivalent transfer function model using the ss2ff function in MATLAB to achieve the open-loop plant G(s).

![image](https://github.com/user-attachments/assets/5fa6886c-0b8e-45a5-93fc-827172307b64)

DSIM Plant model for the H-infinity synthesis (Bansal and Sharma, 2013)

![image](https://github.com/user-attachments/assets/5ea6b41d-b151-433b-9495-f12e0a159a4d)

General control problem (Bansal and Sharma, 2013)

The objective is to find a controller K, which, based on the information in y, generates a control signal u, which counteracts the influence of disturbance w, on the final output z.  The ultimate objective of the robust control is to minimize the effect of disturbance on output; hence the sensitivity function S and the complementary Sensitivity function T are to be reduced. This can be achieved by minimizing the magnitude of |S| and |T| by making
|S(jw)|<1/(W_s (jw) ) and |T(jw)|<1/(W_t (jw) )

Considering the plant in a real environment in figure 3.3, with uncertainties, the inputs to the system becomes the reference input r, and uncertainty inputs: the disturbance D, and feedback sensor noise N. 

![image](https://github.com/user-attachments/assets/c93e70d8-265f-46c0-a019-097709094f46)

H-Infinity Controlled DSIM system with disturbance and noise inputs in real environment


In order to apply H-infinity function technique, weighting functions were introduced to shape the closed-loop performance. The weighting functions were defined as follows:

•	W1(s) manages the output performance and robustness, focusing on high-frequency noise attenuation and low-frequency sensitivity minimization.

•	W2(s) is modeled as a static gain and it manages the control effort by enforcing constraints on it 

In this method, a generalized plant P(s) was created by incorporating the plant G(s), weighting functions W1(s) and W2(s), and also the interconnections for loop shaping using MATLAB functions connect and sumblk.
To synthesize the H-infinity controller, a MATLAB function hinfsyn(P,1,1), was applied to generate the controller K(s), the closed-loop system CL, and the H-infinity norm GAM.
To evaluate the performance of the closed-loop system, the following parameters were examined.

•	The open-loop gain, represented as L = GxH

•	The sensitivity function S = (I+L)-1

•	The complementary sensitivity function T = I-S

### Analyses
•	To analyze the reference tracking and closed-loop dynamics, a step response of T(s) was plotted.

•	To evaluate the stability of the controlled DSIM, bode response of T(s) was plotted.

•	Finally, to analyze the reference tracking, sensitivity and stability of the closed loop system, sigma response of T(s), S(s), and L(s) were plotted.

## Results
![image](https://github.com/user-attachments/assets/c5b64d55-8331-49ba-b6ad-a31f40cd75d6)

DSIM step function showing the settling time

![image](https://github.com/user-attachments/assets/cfaee703-3f5e-408e-921e-b1b6fb6752be)

DSIM bode plot function showing the overshoot and peak amplitude

![image](https://github.com/user-attachments/assets/4130f185-48c4-4c0f-aaf4-5d938b23e6ad)

H-infinity controlled DSIM step function showing the settling time


![image](https://github.com/user-attachments/assets/c74bdf85-dbaa-4852-b6bd-74aa1ce29a53)

Bode plot function of the H-infinity controlled DSIM


![image](https://github.com/user-attachments/assets/f793ae8f-307b-43ba-8f6e-3113ba9e4089)

The sigma plot of the H-Infinity controlled DSIM showing the loop shaping











