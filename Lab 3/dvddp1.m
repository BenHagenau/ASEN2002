function [ dvddpo ] = dvddp1( R,dynamic_pressure,Tatm,Patm )

dA = 1/9.5;

dvddpo = R * Tatm / (sqrt(2) * (1 - dA^2) * Patm * sqrt(R * Tatm * dynamic_pressure / ((1 - dA^2) * Patm)));

end

