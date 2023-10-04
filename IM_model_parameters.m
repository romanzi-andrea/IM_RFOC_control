%R-FOC
clc
clear
close all

%% IM PARAMETERS
f  = 50;
Rs   = 0.24; 
Ls   = 59.4e-3;
Lr   = 59.1e-3;
Lm   = 57e-3;
Rr   = 0.175;
np   = 3;
n    = 6;
vsat = 380;
Lks = Ls- Lm^2/Lr;

% compressor param 
J   = 0.4;
B   = 0.068;  % Stima
k = 0.009;
r = 4;

% data from experiments 
wm_n = 104.9;
wb = 71;
isd_n = 34.6;
isq_n = 1.278;
Yrd_n = 1.9373;
%% regulators
s = tf('s');
Rks = Rs+Rr;
wc_des_cdq = 10000;
Gcdq = 1/(Rks+s*Lks);
%same controller for dq currents
Rcdq = wc_des_cdq*(Rks+s*Lks)/s;
kpcdq = .4425*100;
kicdq = 41.5*100;            
 
wc_des_w = 1000;
wc_des_Yr = 1000;

Gw = 1/(B+J*s);
Rw = wc_des_w*(B+J*s)/s;
kpw = 0.4*1000;
kiw = 0.068*1000;
GYr = Lm/(1+s*Lm/Rr);
RYr = wc_des_Yr*(1/Lm+s/Rr)/s;
kpYr = 5.71429*1000;
kiYr = 17.54286*1000;
