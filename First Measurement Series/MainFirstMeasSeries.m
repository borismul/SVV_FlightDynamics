%Created on 10-3 by  Boris and Christel

clc
close all
clear all

hp = [1,2,3,4];
M = [1,1.1,1,10];
dT = [1,1,1,1];
Mf1 = [1,1.1,1.2,1.3];
Mf2 = [1,1.1,1.2,1.4];

thrust = ThrustExecution(hp,M,dT,Mf1,Mf2)

[p,M,T,a,T_ISA] = AtmosphereParameters(p_0, rho_0, lamdba, h_p, T_0, T_m, g_0, R, gamma, V_cas);