
%MINIMOS CUADRADOD DE UN POLINOMIO GRADO N

x = input('Ingrese el vector de Xs entre corchetes [ ]: ');
y = input('Ingrese el vector de Ys entre corchetes [ ]: ');
%x = [1 3 4 6 8 9 11 14]; % ejemplo de datos x
%y = [1 2 4 4 5 7 8 9]; % ejemplo de datos y

% Grado del polinomio
n = 4; 

% Crear la matriz X para el ajuste de polinomio de grado n
X = ones(length(x), n+1);  % Inicializar la matriz X
for i = 2:n+1
    X(:,i) = x.^(n+2-i);  % Rellenar la matriz X con las potencias de x
end

% Calcular los coeficientes utilizando mínimos cuadrados
theta = X\y';  % Resolver el sistema de ecuaciones para los coeficientes

% Los coeficientes a_n, a_(n-1), ..., a_1, a_0
fprintf('La ecuación del polinomio ajustado es: y = ');
for i = 1:n+1
    fprintf('%.4fx^%d', theta(i), n-i+1);
    if i < n+1
        fprintf(' + ');
    end
end
fprintf('\n');

% Graficar los datos y el polinomio ajustado
figure;
scatter(x, y, 'ro'); % Puntos experimentales
hold on;
x_fit = linspace(min(x), max(x), 100); % Puntos para graficar el polinomio
y_fit = 0; % Inicializamos el valor de y_fit
for i = 1:n+1
    y_fit = y_fit + theta(i) * x_fit.^(n-i+1); % Sumar los términos del polinomio
end
plot(x_fit, y_fit, 'b-', 'LineWidth', 2); % Polinomio ajustado

% Etiquetas y título
xlabel('x');
ylabel('y');
title(['Ajuste de Polinomio de Grado ', num2str(n), ' de Mínimos Cuadrados']);
legend('Datos experimentales', 'Polinomio ajustado', 'Location', 'Best');
grid on;
hold off;

% Cálculo del error cuadrático total
y_pred = 0; % Inicializamos los valores predichos
for i = 1:n+1
    y_pred = y_pred + theta(i) * x.^(n-i+1); % Sumar los términos predichos
end
error = sum((y - y_pred).^2); % Error cuadrático total

fprintf('El error cuadrático total es: %.4f\n', error);
