%Read File

function [V10,V20,V30,V10_avg,V20_avg,V30_avg] = ReadFile
for i = 1:10
    if i == 10
        file = 'AirfoilPressure_S013_G10_LA.csv';
    else
        file = sprintf('AirfoilPressure_S013_G0%d_LA.csv',i);
    end
    data = csvread(file,1,0);
%seperate data by air speed
%[1-500] [502 - 1001] [1002 - 1501] [1502 - 2001] [2002 -2501] [2502 -3001]
%[3002 - 3501] [3502 - 4001] [4002 - 4501] 
%[ v10 angle 1 - v20 angle 1 - v30 angle 1... 10 angle 2 - 20 angle 2 - 30 angle 2...

%set group data for a velocity all 3 angles and concatinate on
    v10{1,i} = [data(1:500,:); data(1501:2000,:); data(3001:3500,:)];
    v20{1,i} = [data(501:1000,:); data(2001:2500,:); data(3501:4000,:)];
    v30{1,i} = [data(1001:1500,:); data(2501:3000,:); data(4001:4500,:)];
end
%velocity 10 data at all angles
V10 = [v10{1,1}; v10{1,2}; v10{1,3}; v10{1,4}; v10{1,5}; v10{1,6}; ...
    v10{1,7}; v10{1,8}; v10{1,9}; v10{1,10}]; 
%velocity 20 data at all angles
V20 = [v20{1,1}; v20{1,2}; v20{1,3}; v20{1,4}; v20{1,5}; v20{1,6}; ...
    v20{1,7}; v20{1,8}; v20{1,9}; v20{1,10}]; 
%velocity 30 data at all angles
V30 = [v30{1,1}; v30{1,2}; v30{1,3}; v30{1,4}; v30{1,5}; v30{1,6}; ...
    v30{1,7}; v30{1,8}; v30{1,9}; v30{1,10}]; 
%sort rows in ascending angle order
V10 = sortrows(V10,23);
V20 = sortrows(V20,23);
V30 = sortrows(V30,23);

%AVERAGE DATA FOR EACH VOTAGE AT EACH ANGLE OF ATTACK
%v = 10
V10_avg = zeros(31,28);
V20_avg = zeros(31,28);
V30_avg = zeros(31,28);
k = 1;
c = 1;
for i = 1:500:15000
    for j = 1:28
        V10_avg(c,j) = mean(V10(k:i-1,j));
    end
    c = c+1;
    k = i;
end
%get end case 
for i = 1:28
    V10_avg(31,i) = mean(V10(14501:15000,i));
end

%v = 20
k = 1;
c = 1;
for i = 1:500:15000
    for j = 1:28
        V20_avg(c,j) = mean(V20(k:i,j));
    end
    c = c+1;
    k = i;
end
%get end case 
for i = 1:28
    V20_avg(31,i) = mean(V20(14501:15000,i));
end

%v = 30
k = 1;
c = 1;
for i = 1:500:15000
    for j = 1:28
        V30_avg(c,j) = mean(V30(k:i,j));
    end
    c = c+1;
    k = i;
end
%get end case 
for i = 1:28
    V30_avg(31,i) = mean(V30(14501:15000,i));
end
V10_avg(1,:) = [];
V20_avg(1,:) = [];
V30_avg(1,:) = [];
end
