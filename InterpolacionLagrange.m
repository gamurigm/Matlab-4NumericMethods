clc; clear; close all;
syms x;

% Definir la función original
f_original = @(x) (x+1) ./ (3*x.^2 + 2*x + 1);

% Seleccionar puntos de interpolación
X = linspace(0, 5, 5); % 5 puntos equidistantes
f_values = f_original(X); % Evaluar la función en esos puntos

% Obtener el polinomio interpolante
p = LagrangeInt(X, f_values); % Se corrigió el nombre de la función

% Graficar la función original y el polinomio interpolante
figure;
fplot(f_original, [0, 5], 'b-', 'LineWidth', 1.5);
hold on;
fplot(p, [0, 5], 'r--', 'LineWidth', 1.5);
legend('Función original', 'Interpolación de Lagrange');
title('Interpolación de Lagrange');
grid on;

% Calcular el error en incrementos de 0.2
x_vals = 0:0.2:5;
y_vals = f_original(x_vals);
p_vals = double(subs(p, x, x_vals));
error_vals = y_vals - p_vals;

% Graficar el error
figure;
plot(x_vals, error_vals, 'k-', 'LineWidth', 1.5);
title('Distribución del Error');
xlabel('x');
ylabel('Error E(x)');
grid on;
