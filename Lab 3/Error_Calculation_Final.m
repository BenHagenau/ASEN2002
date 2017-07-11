%%  First Go to the Data Folder and Run this to get the data populated
[A11,A12,A21,A22,A31,A32] = ReadData;
[p7_11, p8_11, p9_11, p10_11, p7_12, p8_12, p9_12, p10_12, p7_13, p8_13, p9_13, p10_13] = ReadDataBd();

%% Then go back to the code folder to continue

%Equations_list % Populate the equations list (mostly for error analysis)

%Concatenate Data
AC = [A11,A12,A21,A22,A31,A32];
AC = abs(AC);

R = 286.9;
errPatm = 3450;
errTatm = 0.25;
errdelP = 68.94757;

Vieps = zeros(20,3);
Viesr = zeros(20,3);

for i = 1:20
    k = 1;
    for j = [1,15,29]
        Vieps(i,k) = V_unc_pitot_static(R,AC(i,j+2),AC(i,j+1),AC(i,j),errdelP,errPatm,errTatm);
        k = k + 1;
    end
    k = 1;
    for j = [8,22,36]
        Viesr(i,k) = V_unc_static_ring(R,AC(i,j+2),AC(i,j+1),AC(i,j),errdelP,errPatm,errTatm);
        k = k + 1;
    end
end

% Graph the Results
figure
errorbar(A11(:,7),windspeed_ps_aux',Vieps(:,1),'rx')
title('Velocity at Certain Voltages with Error in Pitot-Static Tube')
xlabel('Voltage (V)')
ylabel('Velocity (m/s)')

figure
errorbar(A11(:,7),windspeed_sr_aux',Viesr(:,1),'kx')
title('Velocity at Certain Voltages with Error in Static Ring')
xlabel('Voltage (V)')
ylabel('Velocity (m/s)')
