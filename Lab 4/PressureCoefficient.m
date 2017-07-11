% calculate pressure coefficient
function [cl] = PressureCoefficient(V10,V20,V30,V10_avg,V20_avg,V30_avg)
% Cp = (p-pinf)/(.5*rho*V^2)

% angle of attack = -14, voltage = 10
a = 22; %row for change angle of attack
cp = zeros(1,17);
k = linspace(0,15000,31);

x=[0 0.175 0.35 0.7 1.05 1.4 1.75 2.1 2.8 2.8 2.1 1.4 1.05 0.7 0.35 0.175 0];
x1=[0 0.175 0.35 0.7 1.05 1.4 1.75 2.1 2.8 3.5 2.8 2.1 1.4 1.05 0.7 0.35 0.175 0];
% Divide by cord length for plotting purposes
xplot = x/3.5;
xplot1 = x1/3.5;

for k = [10 20 30]
    figure
    data = eval(sprintf('V%d_avg',k));
    for i = 1:30
% calculate coefficient of pressure
        q = data(i,5);
        for j = 7:22
            pressure(i,j-6) = data(i,j);
            Cp(i,j-6) = pressure(i,j-6);
        end
        Cp(i,17)=Cp(i,1);
% lines of best fit
        coeffUpper = polyfit(xplot(8:9),Cp(i,8:9),1);
        coeffLower = polyfit(xplot(10:11),Cp(i,10:11),1);
        portendUpper = coeffUpper(1).*1+coeffUpper(2);
        portendlower = coeffLower(1).*1+coeffLower(2);
% average value at x = 3.5
        Cp(i,10) = (portendUpper+portendlower)/2;
% made a new vector for cP to incorporate the value at end of foil
        Cp(i,1:9) = Cp(i,1:9);
        Cp(i,11:18) = Cp(i,10:17);
% Calc the coefficient of lift for each angle of attack
        cl(k/10,i) = trapz(xplot1,Cp(i,1:18)); 
% Plot coefficient of pressure
    plot(xplot1,Cp(i,1:18))
    hold on
    title(sprintf('Pressure Coefficient at %3.3f [m/s] Air Speed',data(i,23),k));
% Invert axis
    set(gca,'Ydir','reverse')
    
    
    end
end
%plot lift coefficient by angle of attack
figure
hold on
plot(-14:15,cl(1,:))
plot(-14:15,cl(2,:))
plot(-14:15,cl(3,:))
set(gca,'Ydir','reverse')
xlabel('Angle of Attack')
ylabel('Lift Coefficient')
title(sprintf('Lift Coefficient v.s. Angle of Attack'));
legend('Air Speed 10', 'Air Speed 20','Air Speed 30','Location','Best')
    
    
    
    