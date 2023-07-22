% The MATLAB code calculates the dielectrical properties of the material tested, based on the dielectric properties of deionized water and air.
% Clear command window and figure window
clc;
clf;

% Read the water data
fid1_1 = fopen('water1.dat','rt');  % Open water1 file
SS1_1 = textscan(fid1_1, '%f %f %f');  % Read data from the file

fid1_2 = fopen('water2.dat','rt');  % Open water2 file
SS1_2 = textscan(fid1_2, '%f %f %f');  % Read data from the file

fid1_3 = fopen('water3.dat','rt');  % Open water3 file
SS1_3 = textscan(fid1_3, '%f %f %f');  % Read data from the file

% Read the air data
fid0_1 = fopen('air1.dat','rt');  % Open air1 file
SS0_1 = textscan(fid0_1, '%f %f %f');  % Read data from the file

fid0_2 = fopen('air2.dat','rt');  % Open air2 file
SS0_2 = textscan(fid0_2, '%f %f %f');  % Read data from the file

fid0_3 = fopen('air3.dat','rt');  % Open air3 file
SS0_3 = textscan(fid0_3, '%f %f %f');  % Read data from the file

% Read the unknown data
fid_1 = fopen('fat1.dat','rt');  % Open fat1 file
SS_1 = textscan(fid_1, '%f %f %f');  % Read data from the file

fid_2 = fopen('fat2.dat','rt');  % Open fat2 file
SS_2 = textscan(fid_2, '%f %f %f');  % Read data from the file

fid_3 = fopen('fat3.dat','rt');  % Open fat3 file
SS_3 = textscan(fid_3, '%f %f %f');  % Read data from the file

% Initialize variables based on the size of the data
number_of_rows=size(SS_1{1,1},1);

% Initiate matrices with zeroes to store calculated values
f=zeros(number_of_rows,1,'double');
real_1=zeros(number_of_rows,1,'double');
imag_1=zeros(number_of_rows,1,'double');
phase_1=zeros(number_of_rows,1,'double');
mag_1=zeros(number_of_rows,1,'double');
real1=zeros(number_of_rows,1,'double');
imag1=zeros(number_of_rows,1,'double');
real0=zeros(number_of_rows,1,'double');
imag0=zeros(number_of_rows,1,'double');

% Calculate real and imaginary components, phase and magnitude
for i=1:number_of_rows
    f(i,1)             = SS_1{1,1}(i,1)*10^6;
    real_1(i,1)        = (SS_1{1,2}(i,1)+SS_2{1,2}(i,1)+SS_3{1,2}(i,1))/3;
    imag_1(i,1)        = (SS_1{1,3}(i,1)+SS_2{1,3}(i,1)+SS_3{1,3}(i,1))/3;
    phase_1(i,1)       = atan(imag_1(i,1)/real_1(i,1));
    mag_1(i,1)         = sqrt(real_1(i,1)^2+imag_1(i,1)^2);
    real1(i,1)         = (SS1_1{1,2}(i,1)+SS1_2{1,2}(i,1)+SS1_3{1,2}(i,1))/3;
    imag1(i,1)         = (SS1_1{1,3}(i,1)+SS1_2{1,3}(i,1)+SS1_3{1,3}(i,1))/3;
    real0(i,1)         = (SS0_1{1,2}(i,1)+SS0_2{1,2}(i,1)+SS0_3{1,2}(i,1))/3;
    imag0(i,1)         = (SS0_1{1,3}(i,1)+SS0_2{1,3}(i,1)+SS0_3{1,3}(i,1))/3;
end

% Initialize variables for loop
patlayan_eps=0;
patlayan_cond =0;
Y=0;

% Speed of light
c = 3*10^8;
Eps_t = 2.03-0.004j;

C_1 = zeros(number_of_rows,3,'double');

condvector_1 = zeros(1,number_of_rows,'double');
epsreal_1 = zeros(1,number_of_rows,'double');

patladi=0;

for i=1:1:number_of_rows

    it=0;

    w            =  f(i,1)*2*pi;
    Eps_1        =  4.6+(78.3-4.6)/(1+(1j*w*8.08*10^(-12))^(1-0.014));


    wavelength_t =  (c/(sqrt(real(Eps_t))))/f(i,1);
    Beta_t       =  2*pi/wavelength_t;
    Beta_0       =  (2*pi*f(i,1))/c;

    R_m          =  real_1(i,1) + imag_1(i,1)*(1j);

    R_m0         =  real0(i,1) + imag0(i,1)*(1j);
    R_m1         =  real1(i,1) + imag1(i,1)*(1j);
    p_R1         = (Eps_t^(1/2)-Eps_1^(1/2))/(Eps_t^(1/2)+Eps_1^(1/2)) ;

    p_R0         = (Eps_t^(1/2)-1)/(Eps_t^(1/2)+1) ;

    L_f          =  10000;
    L_0          =  500;

    D_0 = (log(R_m0)+log((1+ p_R0*exp((-2j)*Beta_0*L_0)/(p_R0+exp((-2j)*Beta_0*L_0)))))/((-2)*1j)/Beta_t;



    while (1)
        L_0 = (c/(w*Eps_1^(1/2)))*atan((((-1j)*Eps_t^(1/2))/Eps_1^(1/2))*(1-(R_m1*exp((2j)*Beta_t*D_0)))/(1+(R_m1*exp((2j)*Beta_t*D_0))));

        if (abs(L_f - L_0)<=0.0000000001 )
            break
        end
        L_f = L_0;
        D_f = (     log((R_m0)*(1+ p_R0*exp((-2j)*Beta_0*L_f))/(p_R0+exp((-2j)*Beta_0*L_f)))           )/((-2j)*Beta_t);


        D_0 = D_f;
        it=it+1;
        if (it>99)
            patladi=4
            i
            break
        end

    end
    it=0;
    Ro = R_m*exp((2j)*D_0*Beta_t);
    Eps_0 = (sqrt(Eps_t)*c*(1-Ro))   /   (w*L_f*(1+Ro)*(1j));


    while(1)

        X = w*L_f*sqrt(Eps_0)   /   c;

        Eps_f = (sqrt(Eps_t)/(1j))  *  (c/(w*L_f))   *   ((1-Ro)/(1+Ro))  *  X  *  cot(X);

        if (abs(real(Eps_0) - real(Eps_f))<=0.0000000001)
            if (abs(imag(Eps_0) - imag(Eps_f))<=0.0000000001)
                break
            end
        end

        it=it+1;

        if (it>99)
            patladi=5
            i
            break
        end

        Eps_0 = Eps_f;

    end
    Eps_0 = Eps_f;
    cond=imag(-Eps_0)*w*8.85*10^(-12);




    condvector_1(i) = cond;
    epsreal_1(i) = real(Eps_0);

    C_1(i,1) = w/(2*pi);
    C_1(i,2) = cond;
    C_1(i,3) = real(Eps_0);


end


y = smoothdata(epsreal_1,'movmean','SmoothingFactor',0.6);
y = smoothdata(y,'movmean','SmoothingFactor',0.5);
y = smoothdata(y,'movmean','SmoothingFactor',0.4);
y = smoothdata(y,'movmean','SmoothingFactor',0.3);
y = smoothdata(y,'movmean','SmoothingFactor',0.2);
y = smoothdata(y,'movmean','SmoothingFactor',0.1);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);


% Plot smoothed and calculated values
subplot(2,2,1)
plot(f,y)
title ("Smoothed")
subplot(2,2,2)
plot(f,epsreal_1)
title ("Calculated")

% Smooth the data
y = smoothdata(condvector_1,'movmean','SmoothingFactor',0.6);
y = smoothdata(y,'movmean','SmoothingFactor',0.5);
y = smoothdata(y,'movmean','SmoothingFactor',0.4);
y = smoothdata(y,'movmean','SmoothingFactor',0.3);
y = smoothdata(y,'movmean','SmoothingFactor',0.2);
y = smoothdata(y,'movmean','SmoothingFactor',0.1);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);
y = smoothdata(y,'movmean','SmoothingFactor',0.05);


subplot(2,2,3)
plot(f,y)
title ("Smoothed")
subplot(2,2,4)
plot(f,condvector_1)
title ("Calculated")

% Close all open files
fclose(fid1_1);
fclose(fid1_2);
fclose(fid1_3);
fclose(fid0_1);
fclose(fid0_2);
fclose(fid0_3);
fclose(fid_1);
fclose(fid_2);
fclose(fid_3);
