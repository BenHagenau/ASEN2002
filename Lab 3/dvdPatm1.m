function [ dvdPatmo ] = dvdPatm1( R,dynamic_pressure,Tatm,Patm )

dA = 1/9.5;

dvdPatmo = - dynamic_pressure * R * Tatm / (sqrt(2) * (1 - dA^2) * Patm^2 * sqrt(R * Tatm * dynamic_pressure / ((1 - dA^2) * Patm)));

end

