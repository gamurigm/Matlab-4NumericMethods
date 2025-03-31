format long g  % Esto asegura que la salida tendrá la precisión suficiente

x = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8];
y = [0, 2.1220, 3.0244, 3.2568, 3.1399, 2.8579, 2.5140, 2.1639, 1.8358];

% a) trapecios
h = x(2) - x(1);
suma = y(1) + y(end);
for i = 2:length(x) - 1
    suma = suma + 2 * y(i);
end
It = (h / 2) * suma;

% b) Simpson
h = x(2) - x(1);
suma = y(1) + y(end);
for i = 2:2:length(x) - 1
    suma = suma + 4 * y(i);
end
for i = 3:2:length(x) - 2
    suma = suma + 2 * y(i);
end
Is = (h / 3) * suma;

% c) Puntos medios
h = x(2) - x(1);
suma = 0;
for i = 1:length(x) - 1
    xmid = (x(i) + x(i + 1)) / 2;
    ymid = (y(i) + y(i + 1)) / 2;
    suma = suma + ymid;
end
Ipm = h * suma;

% Mostrar resultados con 7 decimales
fprintf('It = %.7f\n', It);
fprintf('Is = %.7f\n', Is);
fprintf('Ipm = %.7f\n', Ipm);

title('Método de Puntos Medios');
xlabel('x'); ylabel('f(x)');
