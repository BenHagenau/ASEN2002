function [ dvddpo ] = dvddp( R,dynamic_pressure,Tatm,Patm )

dvddpo = sqrt((R*Tatm)/(dynamic_pressure*Patm));

end

