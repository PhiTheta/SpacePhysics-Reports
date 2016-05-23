clc;


%datestr(matlab_time);

% t_start = datenum('09-May-2002 06:07:11','dd-mm-yyyy HH:MM:SS');
% t_end = datenum('09-May-2002 11:59:58','dd-mm-yyyy HH:MM:SS');
% ii = find(matlab_time>t_start & matlab_time<t_end);

figure
subplot(4,1,1)
plot(matlab_time,n_H)
%legend('number density (cm^-3)')
xlabel('local time')
ylabel('number density (cm^-3)');
title('number density during MP passage')
datetick

subplot(4,1,2)
plot(matlab_time,BX,matlab_time,BY,matlab_time,BZ);
xlabel('local time')
ylabel('Magnetic Field (nT)');
title('Magnetic Field during MP passage')
legend('Bx','By','Bz')
datetick


subplot(4,1,3)
plot(matlab_time,vpar_H,matlab_time,vperp_H)
xlabel('local time')
ylabel('H+ bulk velocity (km/s)');
title('H+ bulk velocities during MP passage')
legend('H+ parallel','H+ perpendicular')
datetick


subplot(4,1,4)
plot(matlab_time,Tpar_H,matlab_time,Tperp_H)
xlabel('local time')
ylabel('H+ temperature (eV)');
title('H+ temperature during MP passage')
legend('H+ parallel','H+ perpendicular')
datetick

% calculate plasma beta

k_b = 1.38064852e-23; %m2 kg s-2 K-1
Q = 1.602e-19;
q = 1 / 8.617332478e-5;
mu0 = (4*pi)*10^-7;
nttoT = 10^-9;

T = q.*sqrt(Tpar_H.^2 + Tperp_H.^2);
B = nttoT.*sqrt(BX.^2 + BY.^2 + BZ.^2);

beta = ((n_H .* 10^6 ).*k_b.*T) ./ ( B.^2 ./ (2*mu0));


figure
plot(matlab_time,beta)
xlabel('local time')
ylabel('plasma beta')
title('plasma beta during MP passage')
datetick

