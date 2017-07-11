%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Purpose: Calculate boundry layer height at each port, downstream
% crossectional area and average air speed at these crossections
%
% Inputs: Experiment two data for all labe groups
%
% Outputs: center line velocity, downstream cross sectional area, velocity
% at crossection, boundry layer height at each port
%
% Assumptions: no experiment environment anomilies.
%
% Authors: Ben Hagenau
% Created: 19 October 2016
% Edited: 19 October 2016
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [C_velocity,A2,A2_velocity,boundry_estimate] = BoundryLayer(port_7_S011,port_8_S011,port_9_S011,port_10_S011,R,port_7_S012,port_8_S012,port_9_S012,port_10_S012,port_7_S013,port_8_S013,port_9_S013,port_10_S013)

%G1: 7: 0:10, center
%G2: 7: 0:.5:9.5, center
%G3: 8: 0:10, center
%G4: 8:0:.5:9.5, center
%G5: 9:0:10, center
%G6: 9:0:.5:9.5, center
%G7: 10:0:10, center
%G8: 10:0:.5:9.5, center

% DETERMINE WHEN THE VELOCITY IN THE BOUNDRY LAYER IS 95% OF THE AIR SPEED
% AT 5 VOLTS
boundry = zeros(1,4);
%loop through lab sections
for k = 1:3
    DATA7 = eval(sprintf('port_7_S01%d',k));
    DATA8 = eval(sprintf('port_8_S01%d',k));
    DATA9 = eval(sprintf('port_9_S01%d',k));
    DATA10 = eval(sprintf('port_10_S01%d',k));
    %loop through port measurements for each lab section
    for i = 1:4 %for ports 7,8,9,10
        %determine what port data to use 
        if i == 1
            DATA = DATA7;
        elseif i ==2
            DATA = DATA8;
        elseif i == 3
            DATA = DATA9;
        elseif i == 4
            DATA = DATA10;
        end
    %determine free stream velocity
        free_stream(k,i) = sqrt((2*abs(mean([DATA(:,3)]))*R*DATA(23,2))/(DATA(23,1)));
    %determine the calculated center line velocity based on the measured
    %pressure differential
        C_velocity(k,i) = sqrt((2*abs(DATA(23,4))*R*DATA(23,2)/(DATA(23,1))));
        %determine wind speed at each hight for the given port and compare to
        %95 percent of the velocity at the center line
        for j = 3:22 %for positions 0:.5:10
            dp = DATA(j,4);
            Tatm = DATA(j,2);
            Patm = DATA(j,1);
        %determine free stream velocity based on center velocity
            air_speed = sqrt((2*abs(dp)*R*Tatm)/(Patm));
            if air_speed >= .95*free_stream(k,i)
                boundry(k,i) = DATA(j,6); %[mm]
                break
            end
        end
    end
end

%plot the boundry layer for each port
figure 
%create line of best fit for boundry layer data
x = [379.222 379.222 379.222 403.86 403.86 403.86 429.006 429.006 429.006 453.898 453.898 453.898];
y = [boundry(:,1)' boundry(:,2)' boundry(:,3)' boundry(:,4)'];
[coeff] = polyfit(x,y,1);
f = @(x) coeff(1)*x + coeff(2);
plot(linspace(368.3,457.2,100), f(linspace(368.3,457.2,100)))
legend('Line of Best Fit to Display Boundry Layer Trend ','Location','northwest')
hold off
%plot data points
for i = 1:4
    hold on
    if i == 1
        x = [379.222 379.222 379.222];
    elseif i == 2
        x = [403.86 403.86 403.86];
    elseif i == 3
        x = [429.006 429.006 429.006];
    elseif i == 4
        x = [453.898 453.898 453.898];
    end
   scatter(x,boundry(:,i))
end
title('Boundry Height Measurements At Each Port')
xlabel('Distance From Test Section Entrance to Port [mm]')
ylabel('Boundry Height [mm]')
%label each port data
txt1 = 'Port 7';
txt2 = 'Port 8';
txt3 = 'Port 9';
txt4 = 'Port 10';
x = [379.222-.1 403.86-.1 429.006-.1 453.898-.15];
y = [7.5 7.5 7.5 8.8];
text(x(1),y(1),txt1)
text(x(2),y(2),txt2)
text(x(3),y(3),txt3)
text(x(4),y(4),txt4)
hold off
%Use line of best to approximate boundry layer height at each port
%determine second area 
x = [379.222 403.86 429.006 453.898];
for i = 1:4
    boundry_estimate(i) = f(x(i));
end
A1 = 3657.6;
A2 = zeros(1,4);
A2_velocity = zeros(1,4);
for i = 1:4
    A2(i) = A1 - 2*boundry_estimate(i); %[mm]
end
%convert mm^2 to m^2
A2m = A2*10^-3; 
A1m = A1*10^-3;
%Assume free stream is constant because within the error bounds the value
%of A2 is incorrect
fs = mean(mean([free_stream(:,i)]));
for i = 1:4
    %caculate average velocity through cross section above port
    A2_velocity(i) = A1m*fs/A2m(i); %[m/s]
end
%plot area cross section above each port and average wind speed in cross section
figure
hold on
plot(x,A2,'-*')
title('Port Position v.s. Crossection Area')
xlabel('Postion Along Test Section [mm]')
ylabel('Crossectional Area [mm^2]')
%label each port
txt1 = 'Port 7';
txt2 = 'Port 8';
txt3 = 'Port 9';
txt4 = 'Port 10';
x = [379.222-.1 403.86-.1 429.006-.1 453.898-.15];
y = [3645.35 3644.9 3644.5 3644];
text(x(1),y(1),txt1)
text(x(2),y(2),txt2)
text(x(3),y(3),txt3)
text(x(4),y(4),txt4)
hold off

x = [379.222 403.86 429.006 453.898];
figure
hold on
plot(x,A2_velocity,'-*')
title('Port Position v.s. Average Wind Speed Through Crossectional Area')
xlabel('Postion Along Test Section [mm]')
ylabel('Average Wind Speed [m/s]')
%label each port
txt1 = 'Port 7';
txt2 = 'Port 8';
txt3 = 'Port 9';
txt4 = 'Port 10';
x = [379.222-.1 403.86-.1 429.006-.1 453.898-.15];
y = [27.262 27.266 27.269 27.2718];
text(x(1),y(1),txt1)
text(x(2),y(2),txt2)
text(x(3),y(3),txt3)
text(x(4),y(4),txt4)
hold off

end

