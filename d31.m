% MINIMOS CUADRADOS DE UN POLINOMIO DE GRADO N
% Datos del problema
x = [280 650 1000 1200 1500 1700]; % Temperatura (K)
y = [32.7 45.4 52.15 53.7 52.9 50.3]; % Cp (cal/kgmol)
n = 2; % Grado del polinomio

% Construcción de la matriz del sistema de ecuaciones
X = ones(length(x), n+1);
for i = 2:n+1
    X(:,i) = x.^(n+2-i);
end

% Resolución del sistema por mínimos cuadrados
theta = X\y';

% Cálculo de los valores predichos
y_pred = X * theta;

% Cálculo de residuos
residuos = y' - y_pred;

% Mostrar la ecuación del polinomio ajustado
fprintf('\nLa ecuación del polinomio ajustado es:\nCp(T) = ');
for i = 1:n+1
    fprintf('%.4f T^%d', theta(i), n-i+1);
    if i < n+1
        fprintf(' + ');
    end
end
fprintf('\n');

% Graficar los datos y la curva ajustada
figure('Position', [100, 100, 800, 500]);
scatter(x, y, 'ro', 'filled', 'DisplayName', 'Datos experimentales'); % Puntos experimentales
hold on;
x_fit = linspace(min(x), max(x), 100);
X_fit = ones(length(x_fit), n+1);
for i = 2:n+1
    X_fit(:,i) = x_fit.^(n+2-i);
end
y_fit = X_fit * theta;
plot(x_fit, y_fit, 'b-', 'LineWidth', 2, 'DisplayName', 'Polinomio ajustado');

% Etiquetas y título
xlabel('Temperatura (K)');
ylabel('Cp (cal/kgmol)');
title(['Ajuste de Polinomio de Grado ', num2str(n), ' por Mínimos Cuadrados']);
legend('Location', 'Best');
grid on;
hold off;

% Cálculo del error cuadrático total (SSE)
S = sum(residuos.^2);

% Cálculo de la suma total de cuadrados (ST)
y_mean = mean(y);
ST = sum((y - y_mean).^2);

% Cálculo del coeficiente de determinación R^2
R2 = 1 - (S / ST);

% Cálculo del error estándar de la estimación Se
% Corregido: grados de libertad = n-(grado+1), donde n es el número de datos
% y grado+1 es el número de parámetros estimados
Se = sqrt(S / (length(x) - (n+1)));

% Mostrar resultados estadísticos
fprintf('\nEstadísticas del ajuste:\n');
fprintf('Error cuadrático total (SSE) = %.4f\n', S);
fprintf('Coeficiente de determinación (R^2) = %.4f\n', R2);
fprintf('Error estándar de la estimación (Se) = %.4f\n', Se);

% Imprimir tabla de valores
fprintf('\nTabla de valores y residuos:\n');
fprintf('    T    |    Cp    | Predicho | Residuo\n');
fprintf('---------|----------|----------|--------\n');
for i = 1:length(x)
    fprintf('%8.1f | %8.4f | %8.4f | %8.4f\n', ...
        x(i), y(i), y_pred(i), residuos(i));
end