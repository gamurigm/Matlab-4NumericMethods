
%MINIMOS CUADRADOS LINEAL

x = input('Ingrese el vector de Xs entre corchetes [ ]: ');
y = input('Ingrese el vector de Ys entre corchetes [ ]: ');

%x = [1 3 4 6 8 9 11 14];
%y = [1 2 4 4 5 7 8 9];

% Cálculos para el ajuste de mínimos cuadrados
X = [ones(length(x),1), x'];
theta = X\y';

b = theta(1); % Intercepto
a = theta(2); % Pendiente

fprintf('La ecuación de la recta ajustada es: y = %.4fx + %.4f\n', a, b);

% Graficar los datos y la recta ajustada
figure;
scatter(x, y, 'ro'); % Puntos experimentales
hold on;
x_fit = linspace(min(x), max(x), 100);
y_fit = a*x_fit + b;
plot(x_fit, y_fit, 'b-', 'LineWidth', 2); % Recta ajustada

% Etiquetas y título
xlabel('x');
ylabel('y');
title('Interpolación de Mínimos Cuadrados Lineal');
legend('Datos experimentales', 'Recta ajustada', 'Location', 'Best');
grid on;
hold off;

% Cálculo del error (suma de los cuadrados de las diferencias)
y_pred = a*x + b; % Valores predichos por la recta ajustada
error = sum((y - y_pred).^2); % Error cuadrático total

fprintf('El error cuadrático total es: %.4f\n', error);
