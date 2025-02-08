% Datos del problema
t = [0.0 10.0 27.4 42.1];  % Temperatura en °C
s = [61.5 62.1 66.3 70.3];  % Cantidad de dicromato de potasio

% Transformación logarítmica de s
log_s = log10(s);

% Construcción de la matriz X para el sistema de ecuaciones
% Para la ecuación log₁₀s = a + bt + ct²
n = length(t);
X = [ones(n,1), t', (t.^2)'];  % Matriz de diseño

% Resolución del sistema por mínimos cuadrados
% X * theta = log_s, donde theta = [a; b; c]
theta = X\log_s';

% Extraer los parámetros
a = theta(1);
b = theta(2);
c = theta(3);

% Mostrar los resultados
fprintf('Los parámetros encontrados son:\n');
fprintf('a = %.6f\n', a);
fprintf('b = %.6f\n', b);
fprintf('c = %.6f\n', c);

% Calcular valores predichos para validación
log_s_pred = X * theta;
s_pred = 10.^log_s_pred;

% Cálculo del error
S = sum((log_s - log_s_pred').^2);
% Cálculo de R²
log_s_mean = mean(log_s);
ST = sum((log_s - log_s_mean).^2);
R2 = 1 - (S / ST);
% Error estándar (con n-3 grados de libertad por tener 3 parámetros)
Se = sqrt(S / (n - 3));

fprintf('\nEstadísticas del ajuste:\n');
fprintf('Error cuadrático total (SSE) = %.6f\n', S);
fprintf('Coeficiente de determinación (R²) = %.6f\n', R2);
fprintf('Error estándar de la estimación (Se) = %.6f\n', Se);

% Graficar los resultados
figure;
% Datos originales
scatter(t, log_s, 'ro', 'filled');
hold on;

% Curva ajustada
t_fit = linspace(min(t), max(t), 100);
X_fit = [ones(100,1), t_fit', (t_fit.^2)'];
log_s_fit = X_fit * theta;
plot(t_fit, log_s_fit, 'b-', 'LineWidth', 2);

xlabel('Temperatura (°C)');
ylabel('log₁₀(s)');
title('Ajuste por Mínimos Cuadrados');
legend('Datos experimentales', 'Curva ajustada', 'Location', 'Best');
grid on;
hold off;