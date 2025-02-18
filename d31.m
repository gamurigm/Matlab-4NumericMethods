% MINIMOS CUADRADOS DE UN POLINOMIO DE GRADO N
 
x = [280 650 1000 1200 1500 1700]; 
y = [32.7 45.4 52.15 53.7 52.9 50.3];
n = 2; % Grado del polinomio

%Sistema de ecuaciones
X = ones(length(x), n+1);
for i = 2:n+1
    X(:,i) = x.^(n+2-i);
end

theta = X\y';
y_pred = X * theta;
residuos = y' - y_pred;

fprintf('\nLa ecuación del polinomio ajustado es:\nCp(T) = ');
for i = 1:n+1
    fprintf('%.4f T^%d', theta(i), n-i+1);
    if i < n+1
        fprintf(' + ');
    end
end
fprintf('\n');

scatter(x, y, 'ro', 'filled', 'DisplayName', 'Puntos'); 
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

S = sum(residuos.^2);                   % Cálculo del error cuadrático total (SSE)
y_mean = mean(y);

ST = sum((y - y_mean).^2);              % Cálculo de la suma total de cuadrados (ST)

R2 = 1 - (S / ST);                      % Cálculo del coeficiente de determinación R^2

Se = sqrt(S / (length(x) - (n+1)));     % Cálculo del error estándar de la estimación SE

% Mostrar resultados
fprintf('\nEstadísticas del ajuste:\n');
fprintf('Error cuadrático total (SSE) = %.4f\n', S);
fprintf('Coeficiente de determinación (R^2) = %.4f\n', R2);
fprintf('Error estándar de la estimación (Se) = %.4f\n', Se);

fprintf('\nTabla de valores y residuos:\n');
fprintf('    T    |    Cp    | Predicho | Residuo\n');
fprintf('---------|----------|----------|--------\n');
for i = 1:length(x)
    fprintf('%8.1f | %8.4f | %8.4f | %8.4f\n', ...
        x(i), y(i), y_pred(i), residuos(i));
end