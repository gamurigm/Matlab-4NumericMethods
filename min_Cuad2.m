
%MINIMOS CUADRADOS FUNCIONES CUADRATICAS

x = input('Ingrese el vector de Xs entre corchetes [ ]: ');
y = input('Ingrese el vector de Ys entre corchetes [ ]: ');

% Datos experimentales
%x = [1 3 4 6 8 9 11 14];
%y = [1 2 4 4 5 7 8 9];

% Matriz X para el ajuste cuadrático (incluye x^2, x y 1)
X = [x'.^2, x', ones(length(x), 1)];

% Vector de valores y
y = y';

% Calcular los coeficientes utilizando mínimos cuadrados
theta = X\y;

% Los coeficientes a, b y c
a = theta(1);
b = theta(2);
c = theta(3);

fprintf('La ecuación de la parábola ajustada es: y = %.4fx^2 + %.4fx + %.4f\n', a, b, c);

% Graficar los datos y la parábola ajustada
figure;
scatter(x, y, 'ro'); % Puntos experimentales
hold on;
x_fit = linspace(min(x), max(x), 100); % Puntos para graficar la parábola
y_fit = a*x_fit.^2 + b*x_fit + c; % Ecuación de la parábola ajustada
plot(x_fit, y_fit, 'b-', 'LineWidth', 2); % Parábola ajustada

% Etiquetas y título
xlabel('x');
ylabel('y');
title('Ajuste Cuadrático de Mínimos Cuadrados');
legend('Datos experimentales', 'Parábola ajustada', 'Location', 'Best');
grid on;
hold off;

% Cálculo del error cuadrático total
y_pred = a*x.^2 + b*x + c; % Valores predichos por la parábola ajustada
error = sum((y - y_pred).^2); % Error cuadrático total

fprintf('El error cuadrático total es: %.4f\n', error);
