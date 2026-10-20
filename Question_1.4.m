t = linspace(0,40,1000)
f = 1 % [Hz]


r_m = 0.1 %[m]
mu_x = 0.5 
mu_y = 0.5
mu_r = 1
J = 0.0001 %[ kg* m^2]
R = 10 % [Ohm]
L = 0.1  % [kg⋅m^2⋅s^−2⋅A^−2]
K_r = 1 % [torque/A]
m = 0.01 % [kg] 
b_1 = 2*mu_x + 8*mu_r %9
b_2 = 2*mu_y + 4*mu_r %5
c = r_m^2 * m + 2* J
u_x = 10*sin(2*pi*f*t) %[V]
u_y = 10*cos(2*pi*f*t) %[V]
%u_y = u_m_l - u_m_r 
%u_x = u_m_l + u_m_r


 
Ax= [0,     1,     0;
    0,     -b_1*r_m^2/c,     K_r*r_m/c;
    0,     -2*K_r/(r_m*L),     -R/L];
    
Ay= [0,     1,     0;
    0,     -b_2*r_m^2/c,     K_r*r_m/c;
    0,     -2*K_r/(r_m*L),     -R/L];
Bx = [0;
      0;
      1/L]
By = [0;
      0;
      1/L]
C = [1,0,0]
D = 0
ux = u_x(:)
uy = u_y(:)
x0 = [0,0,0]
y0 = [0,0.01,0]
sys_x = ss(Ax, Bx, C, D)
sys_y = ss(Ay,By, C, D)
x = lsim(sys_x, ux,t)
y = lsim(sys_y, uy,t)



plot(x, y)
ylabel ('y-coordinates ') 
xlabel('x-coordinates ')
grid on;
title (layout , 'Simulation results ')


 