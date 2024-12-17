% % Paso 1: Definir la función
% x = linspace(-10, 10, 1000); % Rango de x
% f = -12 - 21*x + 18*x.^2 - 2.4*x.^3; % Definición de la función
% 
% % Paso 2: Graficar la función
% plot(x, f, 'b-', 'LineWidth', 1.5); % Grafica f(x)
% hold on;
% yline(0, 'r--', 'LineWidth', 1.2); % Línea del eje x
% xlabel('x');
% ylabel('f(x)');
% title('Gráfica de la función f(x)');
% grid on;
% hold off;

% Definir el rango de x excluyendo la región no definida
x = linspace(-5, -1.5, 1000); % Rango enfocado en la raíz negativa

% Definir la función
f = log(x.^2 - 2) + 1 ./ (exp(-x) + 2);

% Graficar la función
plot(x, f, 'b-', 'LineWidth', 1.5);
hold on;
yline(0, 'r--', 'LineWidth', 1.2); % Línea del eje x
xlabel('x', 'FontSize', 12);
ylabel('f(x)', 'FontSize', 12);
title('Gráfica de f(x) = ln(x^2 - 2) + 1/(e^{-x} + 2)', 'FontSize', 14);
grid on;
hold off;

% Agregar texto para indicar posibles raíces
text(-2.5, -2, 'Posible raíz negativa', 'FontSize', 12, 'Color', 'red');


