% Reads and organizes all data. 
function [port_7_S011, port_8_S011, port_9_S011, port_10_S011, port_7_S012, port_8_S012, port_9_S012, port_10_S012, port_7_S013, port_8_S013, port_9_S013, port_10_S013] = ReadDataBd()
%OUTPUT: averaged data matrix for each port, sorted by eld probe height
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%Reads in all data files
numfiles1 = 8;
dataS011 = cell(1, numfiles1);
for k = 1:numfiles1
    myfilename1 = sprintf('BoundaryLayer_S011_G0%d.csv', k);  %data files from section 11
    dataS011{k} = csvread(myfilename1,1,0);
end

numfiles2 = 8;
dataS012 = cell(1, numfiles2);
for k = 1:numfiles2
    myfilename2 = sprintf('BoundaryLayer_S012_G0%d.csv', k); %data files from section 12
    dataS012{k} = csvread(myfilename2,1,0);
end

numfiles3 = 8;
dataS013 = cell(1, numfiles3);
for k = 1:numfiles3
    myfilename3 = sprintf('BoundaryLayer_S013_G0%d.csv', k); %data files from section 13
    dataS013{k} = csvread(myfilename3,1,0);
end

% % % % % % %
% GROUP 011 %
% % % % % % % 
% Averages S011 data
dataSize1 = numfiles1*5;
Avg_S011_data = zeros(dataSize1,7);
j = 1;
for k = 1:8 
    i = 1;
    while  i <= length(dataS011{1,k})
        
     Avg_S011_data(j,:) = mean(dataS011{1,k}(i:i+19,:),1);
        j = j+1;
        i = i +20;
    end
end

port_7_S011 = sortrows(Avg_S011_data(1:24,:),6);
port_8_S011 = sortrows(Avg_S011_data(25:48,:),6);
port_9_S011 = sortrows(Avg_S011_data(49:72,:),6);
port_10_S011 = sortrows(Avg_S011_data(73:end,:),6);

% % % % % % %
% GROUP 012 %
% % % % % % % 
% Averages S012 data
dataSize2 = numfiles2*5; 
Avg_S012_data = zeros(dataSize2,7);
j = 1;
for k = 1:8 
    i = 1;
    while  i <= length(dataS012{1,k})
        
     Avg_S012_data(j,:) = mean(dataS012{1,k}(i:i+19,:),1);
        j = j+1;
        i = i +20;
    end
end
port_7_S012 = sortrows(Avg_S012_data(1:24,:),6);
port_8_S012 = sortrows(Avg_S012_data(25:48,:),6);
port_9_S012 = sortrows(Avg_S012_data(49:72,:),6);
port_10_S012 = sortrows(Avg_S012_data(73:end,:),6);

% % % % % % %
% GROUP 013 %
% % % % % % % 

% Averages S013 data
dataSize3 = numfiles3*5;
Avg_S013_data = zeros(dataSize3,7);%HEY
j = 1;
for k = 1:8 
    i = 1;
    while  i <= length(dataS013{1,k})
        
     Avg_S013_data(j,:) = mean(dataS013{1,k}(i:i+19,:),1);
        j = j+1;
        i = i +20;
    end
end
port_7_S013 = sortrows(Avg_S013_data(1:24,:),6);
port_8_S013 = sortrows(Avg_S013_data(25:48,:),6);
port_9_S013 = sortrows(Avg_S013_data(49:72,:),6);
port_10_S013 = sortrows(Avg_S013_data(73:end,:),6);
end









