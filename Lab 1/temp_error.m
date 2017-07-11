function [ temp, temp_error ] = volt2temp( volt , obj_unc )
%Conversion of measured voltage to temperature for type k thermocouple
    %volt = volt * 10^3;

    a0 = 0;
    a1 = 2.508355*10^(-2);
    a2 = 7.860106*10^(-8);
    a3 = -2.50313*10^(-10);
    a4 = 8.315270*10^(-14);
    a5 = -1.228034*10^(-17);
    a6 = 9.804036*10^(-22);
    a7 = -4.41303*10^(-26);
    a8 = 1.057734*10^(-30);
    a9 = -1.052755*10^(-35);
    
    temp = a0 + a1*volt + a2*volt^2 + a3*volt^3 + a4*volt^4 + a5*volt^5 + ...
        a6*volt^6 + a7*volt^7 + a8*volt^8 + a9*volt^9;

%Determine Fractional Uncertainty for Voltage
fract_unc = obj_unc/voltage;
%Calculate Error
temp_error = (a1*obj_unc + a2*2*fract_unc + a3*3*fract_unc + ...
              a4*4*fract_unc + a5*5*fract_unc + a6*6*fract_unc + a7*7*fract_unc + ...
              a8*8*fract_unc + a9*9*fract_unc)*temp;
end




    