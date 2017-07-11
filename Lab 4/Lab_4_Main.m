%Lab 4 Main
clear all
close all
clc
%read data and orginize by velocity, all angles in ascending order
[V10,V20,V30,V10_avg,V20_avg,V30_avg] = ReadFile;

%determine the pressure coefficient over the wing 
[cl] = PressureCoefficient(V10,V20,V30,V10_avg,V20_avg,V30_avg);