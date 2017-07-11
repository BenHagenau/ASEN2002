% Reads and organizes all data. 
function [Avg_S011_data_one,Avg_S011_data_two,Avg_S012_data_one,Avg_S012_data_two,Avg_S013_data_one,Avg_S013_data_two] = ReadData()
%OUTPUT: data_one = pitotstatic data
%        data_two = static ring data
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%Reads in all data files
numfiles1 = 8;
dataS011 = cell(1, numfiles1);
for k = 1:numfiles1
    myfilename1 = sprintf('VelocityVoltage_S011_G0%d.csv', k);  %data files from section 11
    dataS011{k} = csvread(myfilename1,1,0);
end

numfiles2 = 8;
dataS012 = cell(1, numfiles2);
for k = 1:numfiles2
    myfilename2 = sprintf('VelocityVoltage_S012_G0%d.csv', k); %data files from section 12
    dataS012{k} = csvread(myfilename2,1,0);
end

numfiles3 = 8;
dataS013 = cell(1, numfiles3);
for k = 1:numfiles3
    myfilename3 = sprintf('VelocityVoltage_S013_G0%d.csv', k); %data files from section 13
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
% Seperates S011 data into one: pitotstatic data and two: static ring data
S011_len = ceil(length(Avg_S011_data)/2);
Avg_S011_data_one = zeros(S011_len,7);
Avg_S011_data_two = zeros(S011_len,7);
i = 1;
j = 1;
    while  i <= length(Avg_S011_data) 
        
    Avg_S011_data_one(j:j+4,:) = Avg_S011_data(i:i+4,:);
    i = i+5;
    Avg_S011_data_two(j:j+4,:) = Avg_S011_data(i:i+4,:);
    i = i+5;  
    j = j+5;
    end
% Sorts data by voltage
Avg_S011_data_one = sortrows(Avg_S011_data_one,7);
Avg_S011_data_two = sortrows(Avg_S011_data_two,7);
% % % % % % % % 


% % % % % % %
% GROUP 012 %
% % % % % % % 
dataS012{1,5} = dataS012{1,5}(1:100,:);
dataS012{1,5}(:,:) = dataS011{1,5}(:,:);
% Averages S012 data
dataSize2 = numfiles2*5; %HEY
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
% Seperates S012 data into one: pitotstatic data and two: static ring data
S012_len = ceil(length(Avg_S012_data)/2);
Avg_S012_data_one = zeros(S012_len,7);
Avg_S012_data_two = zeros(S012_len,7);
i = 1;
j = 1;
    while  i <= length(Avg_S012_data) 
        
    Avg_S012_data_one(j:j+4,:) = Avg_S012_data(i:i+4,:);
    i = i+5;
    Avg_S012_data_two(j:j+4,:) = Avg_S012_data(i:i+4,:);
    i = i+5;  
    j = j+5;
    end
% Sorts data by voltage
Avg_S012_data_one = sortrows(Avg_S012_data_one,7);
Avg_S012_data_two = sortrows(Avg_S012_data_two,7);
% % % % % % % % 

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
% Seperates S011 data into one: pitotstatic data and two: static ring data
S013_len = ceil(length(Avg_S013_data)/2);
Avg_S013_data_one = zeros(S013_len,7);
Avg_S013_data_two = zeros(S013_len,7);
i = 1;
j = 1;
    while  i <= length(Avg_S013_data) 
        
    Avg_S013_data_one(j:j+4,:) = Avg_S013_data(i:i+4,:);
    i = i+5;
    Avg_S013_data_two(j:j+4,:) = Avg_S013_data(i:i+4,:);
    i = i+5;  
    j = j+5;
    end
% Sorts data by voltage
Avg_S013_data_one = sortrows(Avg_S011_data_one,7);
Avg_S013_data_two = sortrows(Avg_S011_data_two,7);
% % % % % % % % 

% % % % % % % % % % % % 
% % %combine all data from each section
% % 
% % Sec_com_one = zeros(20,7,3);
% % Sec_com_one(:,:,1) = Avg_S011_data_one;
% % Sec_com_one(:,:,2) = Avg_S012_data_one;
% % Sec_com_one(:,:,3) = Avg_S013_data_one;
% % data_one = mean(Sec_com_one,3);
% % 
% % Sec_com_two = zeros(20,7,3);
% % Sec_com_two(:,:,1) = Avg_S011_data_two;
% % Sec_com_two(:,:,2) = Avg_S012_data_two;
% % Sec_com_two(:,:,3) = Avg_S013_data_two;
% % data_two = mean(Sec_com_two,3);

end









