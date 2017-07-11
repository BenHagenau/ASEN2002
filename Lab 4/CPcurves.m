% This code produces all of the graphs for Cp
clear all
clc
close all

% Reads all of the data into three matrix that have every angle of attack
[V10,V20,V30] = ReadFile;

% Indicate location of the port
x=[0 0.175 0.35 0.7 1.05 1.4 1.75 2.1 2.8 2.8 2.1 1.4 1.05 0.7 0.35 0.175 0];
x1=[0 0.175 0.35 0.7 1.05 1.4 1.75 2.1 2.8 3.5 2.8 2.1 1.4 1.05 0.7 0.35 0.175 0];
% Divide by cord length for plotting purposes
xplot = x/3.5;
xplot1 = x1/3.5;
% Create a vector that will be used to take data points 500 at a time
goods = linspace(0,15000,31);

% Run through every angle of attack 
for i = 1:30
    % Calc dynamic pressure for the 500 data points being observed
    DynP = sum(V30((goods(i)+1):goods(i+1),5))/500;
    % Obtain the averages for each pressure scan pressure and calc Cp
    for j=7:22
    ScanPres(i,j-6) = sum(V30((goods(i)+1):goods(i+1),j))/500;
    Cp(i,j-6) = (ScanPres(i,j-6)/DynP);
    end
    % Make the last value equal to the first for graphing purposes
    Cp(i,17)=Cp(i,1);
    % Best fit curve (Ask Jack)
    coeffU = polyfit(xplot(8:9),Cp(i,8:9),1);
    coeffL = polyfit(xplot(10:11),Cp(i,10:11),1);
    portendU = coeffU(1).*1+coeffU(2);
    portendL = coeffL(1).*1+coeffL(2);
    % average value at x = 3.5
    Cp1(i,10) = (portendU+portendL)/2;
    % made a new vector for cP to incorporate the value at end of foil
    Cp1(i,1:9) = Cp(i,1:9);
    Cp1(i,11:18) = Cp(i,10:17);
    % Calc the coefficient of lift for each angle of attack
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    cl(i) = trapz(xplot1,Cp1(i,1:18));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure(i);
    
    plot(xplot1,Cp1(i,1:18))
    % Invert axis
    set(gca,'Ydir','reverse') 
end 

