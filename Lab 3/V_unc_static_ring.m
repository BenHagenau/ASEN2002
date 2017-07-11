function [ error1 ] = V_unc_static_ring( R,dynamic_pressure,Tatm,Patm,errdelP,errPatm,errTatm) 

ddp1 = dvddp1(R,dynamic_pressure,Tatm,Patm);

ddPatm1 = dvdPatm1(R,dynamic_pressure,Tatm,Patm);
ddPatm1
ddTatm1 = dvdTatm1(R,dynamic_pressure,Tatm,Patm);

error1 = sqrt((ddp1*errdelP).^2 + (ddPatm1*errPatm).^2 + (ddTatm1*errTatm).^2); 

end

