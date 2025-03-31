clc; clear; close all;
% --- Parámetros del circuito ---
R = 20; L = 0.5; C = 0.05; A = 10; omega = 2;

% --- Mallado ---
dt = 0.01;
tFinal = 1;
t = 0:dt:tFinal;
N = length(t);

% --- Vector numérico v_c ---
v_c = zeros(1, N);

% --- Condiciones iniciales ---
v_c(1) = 0;
v_c(2) = 0;

% --- v_s(t) y su derivada ---
v_s = A * sin(omega * t);

% --- Bucle de diferencias finitas ---
for n = 2:(N-1)
    dv_s_dt = (v_s(n) - v_s(n-1)) / dt;
    v_c(n+1) = ( ...
        L*(2*v_c(n) - v_c(n-1)) ...
        - R*dt*(v_c(n) - v_c(n-1)) ...
        - dt^2*(1/C)*v_c(n) ...
        + dt^2*dv_s_dt ) / L;
end