%MINIMOS CUADRADOS FUNCIONES CUADRATICAS
% Entrada de datos
x = input('Ingrese el vector de Xs entre corchetes [ ]: '); %x = [1 3 4 6 8 9 11 14];
y = input('Ingrese el vector de Ys entre corchetes [ ]: '); %y = [1 2 4 4 5 7 8 9];

% Construcción de la matriz de diseño
X = [x'.^2, x', ones(length(x), 1)];
y = y';

% Resolución del sistema por mínimos cuadrados
theta = X\y;
a = theta(1);
b = theta(2);
c = theta(3);

% Mostrar la ecuación ajustada
fprintf('\nLa ecuación de la parábola ajustada es:\ny = %.4fx^2 + %.4fx + %.4f\n', a, b, c);

% Cálculo de valores predichos y residuos para todo el conjunto
y_pred = X * theta;  % Calcula todos los valores predichos de una vez
residuos = y - y_pred;

% Cálculo de estadísticas una sola vez
% Error cuadrático total (SSE)
S = residuos' * residuos;  % Suma de cuadrados de residuos

% Suma total de cuadrados (ST)
y_mean = mean(y);
ST = sum((y - y_mean).^2);

% Coeficiente de determinación R^2
R2 = 1 - (S / ST);

% Error estándar de la estimación
% Grados de libertad = n - 3 (porque estimamos 3 parámetros: a, b, c)
Se = sqrt(S / (length(x) - 3));

% Mostrar estadísticas una sola vez
fprintf('\nEstadísticas del ajuste:\n');
fprintf('Error cuadrático total (SSE) = %.4f\n', S);
fprintf('Coeficiente de determinación (R^2) = %.4f\n', R2);
fprintf('Error estándar de la estimación (Se) = %.4f\n', Se);

% Graficar resultados
figure('Position', [100, 100, 800, 500]);
% Datos experimentales
scatter(x, y, 'ro', 'filled', 'DisplayName', 'Datos experimentales');
hold on;
% Curva ajustada
x_fit = linspace(min(x), max(x), 100);
y_fit = a*x_fit.^2 + b*x_fit + c;
plot(x_fit, y_fit, 'b-', 'LineWidth', 2, 'DisplayName', 'Parábola ajustada');

% Configuración del gráfico
xlabel('x');
ylabel('y');
title('Ajuste Cuadrático por Mínimos Cuadrados');
legend('Location', 'Best');
grid on;
hold off;

% Imprimir tabla de valores y residuos
fprintf('\nTabla de valores y residuos:\n');
fprintf('    x    |    y    | Predicho | Residuo\n');
fprintf('---------|---------|----------|--------\n');
for i = 1:length(x)
    fprintf('%8.4f | %7.4f | %8.4f | %8.4f\n', ...
        x(i), y(i), y_pred(i), residuos(i));
end