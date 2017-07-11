function [ Vinfo ] = Vinf( rho, V1, V2, R, Tatm, Patm, A1, A2 )

[ rhoo ] = rho( R,Tatm,Patm );

dpo = dp(rhoo, V1, V2);

Vinfo = sqrt((2 * dpo * R * Tatm)./(Patm * (1 - (A2 ./ A1).^2)));

end

