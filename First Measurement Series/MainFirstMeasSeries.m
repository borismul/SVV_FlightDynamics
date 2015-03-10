clc
close all
clear all

hp = [1,2,3,4];
M = [1,1.1,1,1];
dT = [1,1,1,1];
Mf1 = [1,1.1,1.2,1.3];
Mf2 = [1,1.1,1.2,1.4];

thrust = ThrustExecution(hp,M,dT,Mf1,Mf2)
