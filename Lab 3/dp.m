function [ dpo ] = dp( rho, V1, V2 )

[ rhoo ] = rho( R,Tatm,Patm );

dpo = (rhoo * (V2.^2 - V1.^2)) / 2;

end

