clear all
clc

Tss=10e-6;

% % Pmin=50e3*.15; %minimum active power, I determined 0.1%
% Pmin=1.25e6*.01;
% V=550;  %inverter phase2phase voltag
% f=60;   %frequency
% fsw=4.8e3; %switching frequency
% P=50e3;
% ff=20*f;
% 
% Cfmax=(0.05*Pmin)/(2*pi*ff*V^2); %5.5uF
% Lf=(0.1*V^2)/(2*pi*ff*Pmin); %9.2mH
% % RLf=Lf*25; %resistance of inductor
% RLf=Lf*25/2; %resistance of inducto

% Filter Design Li-ion
Vdc=1000;
Vdc_min=300;
P=1250000;
Vac=550/sqrt(2);
fg=60;
% Imax=1443;
Imax=P*sqrt(2)/3/550;
fsw=4.8e3

Zb=(Vac)^2/P;
Cb=1/(2*pi*60*Zb);
Il_max=0.1*Imax;
% Il_max=Imax;

L1=Vdc/6/fsw/Il_max;
Cf=0.05*Cb;
ka=20/100;
L2=(sqrt(1/(ka)^2)+1)/Cf/(2*pi*fsw)^2;
wres=sqrt((L1+L2)/L1/L2/Cf);
fres=wres/2/pi;
Rf=1/3/Cf/wres;
Cbus=4*P/Vdc_min^2/4/fg;
if fres<0.5*fsw
    "Filter OK"
end

Lf_1=L1;
RLf_1=Lf_1*25;
Cbus_1=Cbus;


% Filter Design Vanadium
Vdc=390*2;
Vdc_min=390*2;
P=500000;
Vac=380*sqrt(2);
fg=60;
% Imax=1443;
Imax=P*sqrt(2)/3/380;
fsw=4.8e3

Zb=(Vac)^2/P;
Cb=1/(2*pi*60*Zb);
Il_max=0.1*Imax;
% Il_max=Imax;

L1=Vdc/6/fsw/Il_max;
Cf=0.05*Cb;
ka=20/100;
L2=(sqrt(1/(ka)^2)+1)/Cf/(2*pi*fsw)^2;
wres=sqrt((L1+L2)/L1/L2/Cf);
fres=wres/2/pi;
Rf=1/3/Cf/wres;
Cbus=4*P/Vdc_min^2/4/fg;
if fres<0.5*fsw
    "Filter OK"
end

Lf_2=L1;
RLf_2=Lf_2*25;
Cbus_2=Cbus*2;