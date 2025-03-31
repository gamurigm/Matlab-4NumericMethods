% Script para comparar los métodos de Euler y Diferencias Finitas con la solución exacta
% Problema 1: Enfriamiento de un Metal en un Fluido
clear all;
close all;
clc;
% Parámetros del problema
k = 0.1; % constante de enfriamiento en min^-1
Ta = 25; % temperatura ambiente en °C
T0 = 100; % temperatura inicial en °C
tFinal = 5; % tiempo final en minutos
% Tamaños de paso para cada método (ajustados para un rango razonable)
h_euler = 0.5; % tamaño de paso para el método de Euler en minutos
h_fd = 1.0; % tamaño de paso para el método de Diferencias Finitas en minutos

%% Solución Exacta para comparar
t_exacta = linspace(0, tFinal, 100);
T_exacta = Ta + (T0 - Ta) * exp(-k * t_exacta);

%% Método de Euler
n_euler = tFinal/h_euler + 1; % número de pasos de tiempo
t_euler = zeros(1, n_euler); % array de tiempo
T_euler = zeros(1, n_euler); % array de temperatura
% Condición inicial
T_euler(1) = T0; % temperatura inicial es 100°C
% Implementación del método de Euler
for i = 1:n_euler-1
 t_euler(i+1) = t_euler(i) + h_euler;
% Ecuación diferencial: dT/dt = -k(T - Ta)
 T_euler(i+1) = T_euler(i) + h_euler * (-k * (T_euler(i) - Ta));
end

%% Método de Diferencias Finitas
n_fd = tFinal/h_fd + 1; % número de pasos de tiempo
t_fd = zeros(1, n_fd); % array de tiempo
% Generar puntos de tiempo
for i = 1:n_fd
 t_fd(i) = (i-1) * h_fd;
end
% Configurar el sistema de ecuaciones
A = zeros(n_fd, n_fd);
b = zeros(n_fd, 1);
% Condición inicial
A(1, 1) = 1;
b(1) = T0;
% Para los puntos interiores, aplicar diferencia central
for i = 2:n_fd-1
 A(i, i-1) = -1/(2*h_fd);
 A(i, i) = k;
 A(i, i+1) = 1/(2*h_fd);
 b(i) = k * Ta;
end
% Para el último punto, usar diferencia hacia atrás
A(n_fd, n_fd-1) = -1/h_fd;
A(n_fd, n_fd) = 1/h_fd + k;
b(n_fd) = k * Ta;
% Resolver el sistema de ecuaciones
T_fd = A\b;

%% Mostrar Resultados
fprintf('Problema 1: Enfriamiento de un Metal en un Fluido\n');
fprintf('===============================================\n\n');
% Resultados del Método de Euler
fprintf('Método de Euler (h = %.1f min)\n', h_euler);
fprintf('Tiempo (min) | Temperatura (°C)\n');
fprintf('--------------------------------------\n');
for i = 1:n_euler
    fprintf('%6.1f | %12.4f\n', t_euler(i), T_euler(i));
end
fprintf('\n');

% Resultados del Método de Diferencias Finitas
fprintf('Método de Diferencias Finitas (h = %.1f min)\n', h_fd);
fprintf('Tiempo (min) | Temperatura (°C)\n');
fprintf('--------------------------------------\n');
for i = 1:n_fd
    fprintf('%6.1f | %12.4f\n', t_fd(i), T_fd(i));
end

% Comparación con la Solución Exacta
fprintf('\nComparación con la Solución Exacta:\n');
fprintf('-----------------------------------------------------------\n');
fprintf('Tiempo (min) | Valor Exacto (°C) | Euler (°C) | Dif. Finitas (°C)\n');
fprintf('-----------------------------------------------------------\n');

% Calcular valores exactos para cada punto de tiempo de Euler y Diferencias Finitas
for i = 1:length(t_euler)
    % Calcular valor exacto en el tiempo actual
    T_exact = Ta + (T0 - Ta) * exp(-k * t_euler(i));
    
    % Calcular errores porcentuales
    error_euler = abs((T_euler(i) - T_exact)/T_exact) * 100;
    
    % Encontrar el punto más cercano en el método de diferencias finitas
    [~, idx_fd] = min(abs(t_fd - t_euler(i)));
    error_df = abs((T_fd(idx_fd) - T_exact)/T_exact) * 100;
    
    fprintf('%6.1f | %14.4f | %9.4f (%5.2f%%) | %9.4f (%5.2f%%)\n', ...
        t_euler(i), T_exact, T_euler(i), error_euler, T_fd(idx_fd), error_df);
end
fprintf('-----------------------------------------------------------\n');

% Graficar la comparación
figure;
plot(t_exacta, T_exacta, 'k-', 'LineWidth', 1, 'DisplayName', 'Solución Exacta');
hold on;
plot(t_euler, T_euler, 'ro-', 'MarkerSize', 8, 'DisplayName', 'Euler');
plot(t_fd, T_fd, 'bs-', 'MarkerSize', 8, 'DisplayName', 'Dif. Finitas');
xlabel('Tiempo (minutos)');
ylabel('Temperatura (°C)');
title('Comparación con la Solución Exacta');
legend('Location', 'best');
grid on;















% Script for comparing Euler and Finite Difference methods
% Problem 2: Movimiento de un Paracaidista con Resistencia del Aire

% clear all;
% close all;
% clc;
% 
% % Parámetros del Problema
% m = 80;      % masa en kg
% g = 9.81;    % aceleración gravitacional en m/s²
% c = 12;      % coeficiente de resistencia del aire en kg/s
% tFinal = 10; % tiempo final en segundos
% 
% % Calcular velocidad terminal
% v_terminal = m * g / c;
% fprintf('Velocidad terminal teórica: %.2f m/s\n', v_terminal);
% 
% % Tamaños de paso para cada método
% h_euler = 0.5;  % tamaño de paso para el método de Euler en segundos
% h_fd = 1.0;     % tamaño de paso para el método de Diferencias Finitas en segundos
% 
% %% Solución Analítica
% % Crear 1000 puntos equidistantes entre 0 y tFinal
% t_analitica = linspace(0, tFinal, 1000);
% 
% % Calcular velocidad terminal
% v_terminal = m * g / c;  % = (80 * 9.81)/12 ≈ 65.4 m/s
% 
% % Aplicar la solución analítica v(t) = v_terminal * (1 - e^(-(c/m)t))
% % Esta ecuación viene de resolver la EDO: dv/dt = g - (c/m)v
% v_analitica = v_terminal * (1 - exp(-(c/m) * t_analitica));
% 
% % Mostrar algunos puntos de verificación
% fprintf('\nPuntos de verificación de la solución analítica:\n');
% fprintf('Tiempo (s) | Velocidad (m/s) | %% Velocidad Terminal\n');
% fprintf('------------------------------------------------\n');
% check_times = [0 1 2 5 10];  % tiempos específicos para verificar
% for t = check_times
%     idx = find(t_analitica >= t, 1);
%     v = v_terminal * (1 - exp(-(c/m) * t));
%     fprintf('%9.1f | %13.4f | %17.2f%%\n', t, v, (v/v_terminal)*100);
% end
% fprintf('------------------------------------------------\n\n');
% 
% %% Método de Euler
% n_euler = tFinal/h_euler + 1;
% t_euler = zeros(1, n_euler);
% v_euler = zeros(1, n_euler);
% v_euler(1) = 0;  % velocidad inicial
% 
% for i = 1:n_euler-1
%     t_euler(i+1) = t_euler(i) + h_euler;
%     v_euler(i+1) = v_euler(i) + h_euler * (g - (c/m) * v_euler(i));
% end
% 
% %% Método de Diferencias Finitas
% n_fd = tFinal/h_fd + 1;
% t_fd = (0:h_fd:tFinal);
% 
% A = zeros(n_fd, n_fd);
% b = zeros(n_fd, 1);
% 
% % Condición inicial
% A(1,1) = 1;
% b(1) = 0;
% 
% % Puntos interiores
% for i = 2:n_fd-1
%     A(i, i-1) = -1/(2*h_fd);
%     A(i, i) = c/m;
%     A(i, i+1) = 1/(2*h_fd);
%     b(i) = g;
% end
% 
% % Último punto
% A(n_fd, n_fd-2) = 1/(2*h_fd);
% A(n_fd, n_fd-1) = -2/h_fd;
% A(n_fd, n_fd) = 3/(2*h_fd) + c/m;
% b(n_fd) = g;
% 
% v_fd = A\b;
% 
% %% Mostrar Resultados
% fprintf('\nComparación de resultados a t = 10s:\n');
% fprintf('Solución analítica: %.4f m/s\n', v_analitica(end));
% fprintf('Método de Euler: %.4f m/s\n', v_euler(end));
% fprintf('Método de Diferencias Finitas: %.4f m/s\n', v_fd(end));
% fprintf('Velocidad terminal: %.4f m/s\n\n', v_terminal);
% 
% % Tabla de resultados del Método de Euler
% fprintf('\nTabla de velocidades - Método de Euler (h = %.1f s)\n', h_euler);
% fprintf('------------------------------------------------------\n');
% fprintf('Tiempo (s) | Velocidad (m/s) | %% Velocidad Terminal\n');
% fprintf('------------------------------------------------------\n');
% for i = 1:n_euler
%     porc = (v_euler(i)/v_terminal) * 100;
%     fprintf('%9.2f | %13.4f | %17.2f%%\n', t_euler(i), v_euler(i), porc);
% end
% fprintf('------------------------------------------------------\n\n');
% 
% % Tabla de resultados del Método de Diferencias Finitas
% fprintf('Tabla de velocidades - Método de Diferencias Finitas (h = %.1f s)\n', h_fd);
% fprintf('------------------------------------------------------\n');
% fprintf('Tiempo (s) | Velocidad (m/s) | %% Velocidad Terminal\n');
% fprintf('------------------------------------------------------\n');
% for i = 1:n_fd
%     porc = (v_fd(i)/v_terminal) * 100;
%     fprintf('%9.2f | %13.4f | %17.2f%%\n', t_fd(i), v_fd(i), porc);
% end
% fprintf('------------------------------------------------------\n\n');
% 
% % Calcular porcentajes de la velocidad terminal
% porc_analitica = (v_analitica(end)/v_terminal) * 100;
% porc_euler = (v_euler(end)/v_terminal) * 100;
% porc_fd = (v_fd(end)/v_terminal) * 100;
% 
% fprintf('Porcentaje de velocidad terminal alcanzado:\n');
% fprintf('Solución analítica: %.2f%%\n', porc_analitica);
% fprintf('Método de Euler: %.2f%%\n', porc_euler);
% fprintf('Método de Diferencias Finitas: %.2f%%\n', porc_fd);
% 
% %% Visualización
% figure;
% plot(t_euler, v_euler, 'ro-', 'LineWidth', 1, 'MarkerSize', 5, 'DisplayName', sprintf('Euler (h=%.1f)', h_euler));
% hold on;
% plot(t_fd, v_fd, 'bo-', 'LineWidth', 1, 'MarkerSize', 6, 'DisplayName', sprintf('Dif. Finitas (h=%.1f)', h_fd));
% plot(t_analitica, v_analitica, 'k-', 'LineWidth', 1.5, 'DisplayName', 'Solución Analítica');
% plot([0, tFinal], [v_terminal, v_terminal], 'k--', 'LineWidth', 1, 'DisplayName', 'Velocidad Terminal');
% 
% title('Caída del paracaidista (t = 10s)');
% xlabel('Tiempo (segundos)');
% ylabel('Velocidad (m/s)');
% legend('Location', 'best');
% grid on;
% 
% % Añadir texto informativo
% text(1, v_terminal*0.8, sprintf('Velocidad terminal = %.2f m/s\n', v_terminal), ...
%     'FontSize', 10, 'BackgroundColor', 'white');