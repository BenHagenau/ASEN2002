%This script reads the data from the four thermocouples used during the CJC
%trial. The two files are 'Trial1Sept7AirTemp' and 'Trial1Sept7Boiling'.
%It will also average the findings for each time value

clear all
clc
%Open file
fileID = fopen('Trial1Sept7AirTemp');
%Discard first two line
line = fgets(fileID);
line = fgets(fileID);
%Preallocate matrix
data_matrix = zeros(1,5);
%Set starting row iterater
cell = 1;
%Store each line in  a cell
while line > -1 %run until end of the file
    data_cell{cell} = line;
    cell = cell+1;
    line = fgets(fileID);
end
%Change cell to matrix
for i=1:length(data_cell)
    data_matrix(i,:) = str2num(data_cell{i});
end
%Preallocate matrix for average readings
data_avg = zeros(length(data_cell),2);
%Average readings
for i=1:length(data_cell)
    data_avg(i,1) = data_matrix(i,1);
    data_avg(i,2) = sum(data_matrix(i,(2:5)))/4;
end
%Display matrix
data_avg = data_avg;
total_avg = sum(data_avg(:,2))/length(data_cell)

