function [ error ] = V_unc_pitot_static( R,dynamic_pressure,Tatm,Patm,errdelP,errPatm,errTatm) 

ddp = dvddp(R,dynamic_pressure,Tatm,Patm);

ddPatm = dvdPatm(R,dynamic_pressure,Tatm,Patm);

rhoo = rho( R,Tatm,Patm );

ddTatm = dvdTatm(R,rhoo,dynamic_pressure,Patm);

error = sqrt((ddp*errdelP).^2 + (ddPatm*errPatm).^2 + (ddTatm*errTatm).^2); 

end

