%% List of all necessary equations for implementation into final programs.

% Determine the density using ideal gas
rho = @(R,Tatm,Patm) Patm/(R*Tatm);

% Find the test section velocity
Vinf = @(rho, V1, V2, R, Tatm, Patm, A1, A2) sqrt((2 * dp(rho, V1, V2) * R * Tatm)./(Patm * (1 - (A2 ./ A1).^2)));

% Find differential pressure from Bernoulli's equation(static rings)
dp = @(rho, V1, V2) (rho * (V2.^2 - V1.^2)) / 2;

% Find the edge of the boundary layer
del = @(Vinf) 0.95 * Vinf;

%% Lisi of all necessary equations to determine error aggregate in pitot static tube

% Find partial of airspeed with respect to atmospheric temperature
dvdTatm = @(R,dynamic_pressure,Tatm,Patm) sqrt((R*dynamic_pressure)/(Tatm*Patm));

% Find partial of airspeed with respect to atmospheric pressure 
dvdPatm = @(R,dynamic_pressure,Tatm,Patm) sqrt((dynamic_pressure*R*Tatm)/(Patm^3));

% Find partial of air speed with respect differential pressure
dvddp = @(R,dynamic_pressure,Tatm,Patm) sqrt((R*Tatm)/(dynamic_pressure*Patm));

% Find the uncertainty in the airspeed pitot static probe
V_unc_pitot_static = @(R,dynamic_pressure,Tatm,Patm,errdelP,errPatm,errTatm) sqrt((dvddp(R,dynamic_pressure,Tatm,Patm)*errdelP).^2 + (dvdPatm(R,dynamic_pressure,Tatm,Patm)*errPatm).^2 + (dvdTatm(R,rho,dynamic_pressure,Patm)*errTatm).^2); 

%% Lisi of all necessary equations to determine error aggregate in pitot static tube

% Find partial of airspeed with respect to atmospheric temperature
dvdTatm1 = @(R,dynamic_pressure,Tatm,Patm) 

% Find partial of airspeed with respect to atmospheric pressure 
dvdPatm1 = @(R,dynamic_pressure,Tatm,Patm) 

% Find partial of air speed with respect differential pressure
dvddp1 = @(R,dynamic_pressure,Tatm,Patm) 

% Find the uncertainty in the airspeed pitot static probe
V_unc_static_ring = @(R,dynamic_pressure,Tatm,Patm,errdelP,errPatm,errTatm) sqrt((dvddp(R,dynamic_pressure,Tatm,Patm)*errdelP).^2 + (dvdPatm(R,dynamic_pressure,Tatm,Patm)*errPatm).^2 + (dvdTatm(R,rho,dynamic_pressure,Patm)*errTatm).^2); 

