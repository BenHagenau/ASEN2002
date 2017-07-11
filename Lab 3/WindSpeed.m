%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Purpose: Determine the velocity calculated by the pressure differentials
% from the pitot static probe and static rings
%
% Inputs: Data from lab 1 for experiment 1
%
% Outputs:Wind speed corrospinding to each voltage using the pitot static
% and static port pressure differentials
%
% Assumptions: no experiment environment anomilies.
%
% Authors: Ben Hagenau
% Created: 19 October 2016
% Edited: 19 October 2016
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [windspeed_ps_aux,windspeed_sr_aux] = WindSpeed(Avg_S011_data_one,Avg_S011_data_two)
%This function calculates the wind speed based on the pressure measurements
%for each configuration: (1) static port - monometer (2) static port -
%aux (3) pitot static - manometer (4) pitot static - aux

%file format
%Patm, Tatm, dp

%define constants
R = 286.9; %J/(kg K)
A2 = 1; %mm^2
A1 = 9.5; %mm^2

%CALCULATE WIND SPEED FOR PITOT STATIC - AUX (groups 1,3,5,7)
%1: voltage: 1, 3, 5, 7, 9
%3: voltage: 2, 4, 6, 8, 10
%5: voltage: 1.5, 3.5, 5.5, 7.5, 9.5
%7: voltage: .5, 2.5, 4.5, 6.5, 8.5
for i = 1:20
    dp = Avg_S011_data_one(i,3);
    Tatm = Avg_S011_data_one(i,2);
    Patm = Avg_S011_data_one(i,1);
    windspeed_ps_aux(i) = sqrt((2*abs(dp)*R*Tatm)/(Patm));
end

%CALCULATE WIND SPEED FOR STATIC RING - AUX (groups 2,4,6,8)
%2: voltage: 1, 3, 5, 7, 9
%4: voltage: 2, 4, 6, 8, 10
%6: voltage: 1.5, 3.5, 5.5, 7.5, 9.5
%8: voltage: .5, 2.5, 4.5, 6.5, 8.5
for i = 1:20
    dp = Avg_S011_data_two(i,3);
    Tatm = Avg_S011_data_two(i,2);
    Patm = Avg_S011_data_two(i,1);
    windspeed_sr_aux(i) = sqrt((2*abs(dp)*R*Tatm)/(Patm*(1-(A2/A1)^2)));
end
%create line of best fit for the static ring velocity - voltage data
v = .5:.5:10;
[coeff1] = polyfit(v,windspeed_sr_aux,1);
x = linspace(0,10,100);
y1 = coeff1(1)*x + coeff1(2);

figure
hold on
plot(x,y1,'b')
plot(v,windspeed_sr_aux,'k*')
title('Static Ring - Velocity');
xlabel('Voltage, V')
ylabel('Calculated Velocity, m/s')
legend('Line of Best Fit','Location','Best')
hold off

%create line of best fit for the pitot static velocity - voltage data
[coeff2] = polyfit(v,windspeed_ps_aux,1);
y2 = coeff2(1)*x + coeff2(2);

figure
hold on
plot(x,y2,'b')
plot(v,windspeed_ps_aux,'k*')
title('Pitot Static - Velocity')
xlabel('Voltage, V')
ylabel('Calculated Velocity, m/s')
legend('Line of Best Fit','Location','Best')
hold off
end








