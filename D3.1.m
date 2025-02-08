% MINIMOS CUADRADOS DE UN POLINOMIO DE GRADO N

% Datos del problema
x = [280 650 1000 1200 1500 1700];  % Temperatura (K)
y = [32.7 45.4 52.15 53.7 52.9 50.3];  % Cp (cal/kgmol)

n = 2; % Grado del polinomio

% Construcción de la matriz del sistema de ecuaciones
X = ones(length(x), n+1);  
for i = 2:n+1
    X(:,i) = x.^(n+2-i); 
end

% Resolución del sistema por mínimos cuadrados
theta = X\y'; 

% Mostrar la ecuación del polinomio ajustado
fprintf('La ecuación del polinomio ajustado es: Cp(T) = ');
for i = 1:n+1
    fprintf('%.4f T^%d', theta(i), n-i+1);
    if i < n+1
        fprintf(' + ');
    end
end
fprintf('\n');

% Graficar los datos y la curva ajustada
figure;
scatter(x, y, 'ro', 'filled'); % Puntos experimentales
hold on;
x_fit = linspace(min(x), max(x), 100); 
y_fit = 0;
for i = 1:n+1
    y_fit = y_fit + theta(i) * x_fit.^(n-i+1); % Evaluar el polinomio ajustado
end
plot(x_fit, y_fit, 'b-', 'LineWidth', 2); 

% Etiquetas y título
xlabel('Temperatura (K)');
ylabel('Cp (cal/kgmol)');
title(['Ajuste de Polinomio de Grado ', num2str(n), ' por Mínimos Cuadrados']);
legend('Datos experimentales', 'Polinomio ajustado', 'Location', 'Best');
grid on;
hold off;

% Calcular el error cuadrático total
y_pred = 0; 
for i = 1:n+1
    y_pred = y_pred + theta(i) * x.^(n-i+1); 
end
error = sum((y - y_pred).^2); 
fprintf('El error cuadrático total es: %.4f\n', error);
