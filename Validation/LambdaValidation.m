clear all
close all
clc

c = 2.0569;
V = [95.86, 97.5, 96.54];
T = [0.6, 130.15, 6.99];
P = [2, 47.2, 2.75];

% lambda_r = 1./(T.*V./c./log(1/2));
lambda_i = 1./(T.*V./c./log(1/2)) + 1./(P.*V./c./(2*pi())).*1i;