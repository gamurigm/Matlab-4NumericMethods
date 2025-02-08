% MÉTODO DE MÍNIMOS CUADRADOS PARA UN POLINOMIO DE GRADO N
x = input('Ingrese el vector de Xs entre corchetes [ ]: ');
y = input('Ingrese el vector de Ys entre corchetes [ ]: ');
n = input('Ingrese el grado del polinomio: '); % Permitir ajuste dinámico

% Construcción de la matriz del sistema de ecuaciones
X = zeros(length(x), n+1);  % Matriz de diseño
for i = 1:n+1
    X(:,i) = x.^(n-i+1);  
end

% Resolución del sistema por mínimos cuadrados
theta = X\y';

% Mostrar coeficientes individuales
fprintf('\nCoeficientes del polinomio ajustado:\n');
for i = 1:length(theta)
    fprintf('a_%d = %.4f\n', n-i+1, theta(i));
end

% Mostrar la ecuación del polinomio ajustado
fprintf('\nLa ecuación del polinomio ajustado es: y = ');
for i = 1:n+1
    coef = theta(i);
    pot = n-i+1;

    if coef ~= 0
        if i > 1 && coef > 0
            fprintf(' + ');
        elseif coef < 0
            fprintf(' - ');
        end

        if pot == 0
            fprintf('%.4f', abs(coef));  % Término independiente
        elseif pot == 1
            fprintf('%.4fx', abs(coef)); % Término lineal
        else
            fprintf('%.4fx^%d', abs(coef), pot); % Términos mayores
        end
    end
end
fprintf('\n');

% Graficar los datos y la curva ajustada
figure;
scatter(x, y, 'ro'); % Puntos experimentales
hold on;
x_fit = linspace(min(x), max(x), 100);
y_fit = zeros(size(x_fit));
for i = 1:n+1
    y_fit = y_fit + theta(i) * x_fit.^(n-i+1);
end
plot(x_fit, y_fit, 'b-', 'LineWidth', 2);
xlabel('x');
ylabel('y');
title(['Ajuste de Polinomio de Grado ', num2str(n), ' por Mínimos Cuadrados']);
legend('Datos experimentales', 'Polinomio ajustado', 'Location', 'Best');
grid on;
hold off;

% Cálculo de valores predichos
y_pred = X * theta;  

% Cálculo del error cuadrático total (SSE)
SSE = sum((y' - y_pred).^2);
fprintf('\nEl error cuadrático total (SSE) es: %.4f\n', SSE);

% Cálculo de la suma total de cuadrados (SST)
y_mean = mean(y);
SST = sum((y - y_mean).^2);

% Cálculo del coeficiente de determinación R^2
R2 = 1 - (SSE / SST);
fprintf('El coeficiente de determinación (R^2) es: %.4f\n', R2);

% Cálculo del error estándar de la estimación Se
Se = sqrt(SSE / (length(x) - (n+1)));
fprintf('El error estándar de la estimación (Se) es: %.4f\n', Se);
