%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Purpose: Estimate the Free stream velocity and its uncertainty using the
% pressure differential measurements from a U-tube manometer and a pitot
% tube in a low speed wind tunnel
%
% Inputs: Data from ITLL subsonic wind tunnel
%
% Outputs: Wind Speeds at corrospinding fan voltages, boundry layer effect,
% uncertainties of all values
%
% Assumptions: no experiment environment anomilies.
%
% Authors: Group 8
% Created: 19 October 2016
% Edited: 19 October 2016
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
clc
% Define constants, ideal gas constant, atm. pressure uncertainty, atm.
% temperature uncertainty, pitot tube differential pressure uncertainth,
% manometer differential pressure uncertainty. 
R = 286.9; %[J/(kg K)]
errPatm = 3.75; %[kPa]
errTatm = 0.25; %[C]
errdp_aux = 0.01; %[kPa]
errdp_monometer = 10.3; %[kPa]

% Define General Equations
% Equations_list

% Transfer data from Input File 
[Avg_S011_data_one,Avg_S011_data_two,Avg_S012_data_one,Avg_S012_data_two,Avg_S013_data_one,Avg_S013_data_two] = ReadData();
[port_7_S011, port_8_S011, port_9_S011, port_10_S011, port_7_S012, port_8_S012, port_9_S012, port_10_S012, port_7_S013, port_8_S013, port_9_S013, port_10_S013] = ReadDataBd();

% Calculate air speed
[windspeed_ps_aux,windspeed_sr_aux] = WindSpeed(Avg_S011_data_one,Avg_S011_data_two);
% Boundry layer
[C_velocity,A2,A2_velocity,boundry_estimate] = BoundryLayer(port_7_S011,port_8_S011,port_9_S011,port_10_S011,R,port_7_S012,port_8_S012,port_9_S012,port_10_S012,port_7_S013,port_8_S013,port_9_S013,port_10_S013);

% Error Calculations
Error_Calculation_Final;

% Boundary Layer Estimation

