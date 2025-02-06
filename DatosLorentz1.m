clc; clear; close all;
syms x;

% Datos de la tabla
X = [25 50 75 100]; % Porcentaje de población
Y = [10 25 70 100]; % Porcentaje de ingreso económico

% Construcción del polinomio interpolante de Lagrange
p = 0;
n = length(X);

for i = 1:n
    L = 1;
    for j = 1:n
        if i ~= j
            L = L * (x - X(j)) / (X(i) - X(j));
        end
    end
    p = p + L * Y(i);
end

p = expand(p); % Expandir el polinomio
disp('Polinomio interpolante:')
pretty(p)

% (b) Evaluar el polinomio en x = 60
x_val = 60;
ingreso_60 = double(subs(p, x, x_val));
fprintf("\nEl porcentaje de ingreso para 60%% de la población es: %.4f%%\n", ingreso_60);

% (c) Resolver p(x) = 60 con el método de Newton
f = @(x) double(subs(p, x)) - 60; % Función para encontrar la raíz
df = matlabFunction(diff(p)); % Derivada de la función

% Método de Newton-Raphson
x0 = 50; % Valor inicial
tol = 1e-6;
max_iter = 100;

for k = 1:max_iter
    x1 = x0 - f(x0) / df(x0);
    if abs(x1 - x0) < tol
        break;
    end
    x0 = x1;
end

fprintf("\nEl porcentaje de población correspondiente al 60%% de ingreso es: %.4f%%\n", x1);

% Gráfica
figure;
fplot(p, [20, 105], 'b-', 'LineWidth', 1.5);
hold on;
plot(X, Y, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
plot(x_val, ingreso_60, 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
plot(x1, 60, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k');

xlabel('Porcentaje de Población');
ylabel('Porcentaje de Ingreso');
title('Curva de Lorenz - Interpolación de Lagrange');
legend('Polinomio interpolante', 'Datos originales', 'Ingreso para 60% de población', 'Población para 60% de ingreso');
grid on;
hold off;
