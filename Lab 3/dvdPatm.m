function [ dvdPatmo ] = dvdPatm( R,dynamic_pressure,Tatm,Patm )

dvdPatmo = sqrt((dynamic_pressure*R*Tatm)/(Patm^3));

end

