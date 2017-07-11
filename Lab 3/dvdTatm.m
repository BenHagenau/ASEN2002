function [ dvdTatmo ] = dvdTatm( R,dynamic_pressure,Tatm,Patm )

dvdTatmo = sqrt((R*dynamic_pressure)/(Tatm*Patm));

end

