clc; clear; close all;
syms x;  % Definir x como variable simbólica

% Solicitar al usuario que ingrese la función
func_str = input('Ingrese la función en términos de x (por ejemplo, sin(x), x^2, exp(x)): ', 's');
f_sym = str2sym(func_str);  % Convertir la cadena a una expresión simbólica
f = matlabFunction(f_sym);  % Convertir la expresión simbólica a función anónima

% Calcular la derivada exacta automáticamente
df_sym = diff(f_sym, x);  % Derivada simbólica de f(x)
df = matlabFunction(df_sym);  % Convertir a función anónima

% Solicitar valores de x0 y h
x0 = input('Ingrese el valor de x0: ');
h = input('Ingrese el valor de h: ');

% Cálculo de derivadas numéricas
df_progresiva = (f(x0 + h) - f(x0)) / h;
df_regresiva = (f(x0) - f(x0 - h)) / h;
df_central = (f(x0 + h) - f(x0 - h)) / (2*h);

% Evaluar la derivada exacta en x0
df_exacta = df(x0);

% Cálculo de errores
error_progresiva = abs(df_progresiva - df_exacta);
error_regresiva = abs(df_regresiva - df_exacta);
error_central = abs(df_central - df_exacta);

% Mostrar resultados
disp(['Derivada progresiva en x0 = ', num2str(df_progresiva), ', Error: ', num2str(error_progresiva)]);
disp(['Derivada regresiva en x0 = ', num2str(df_regresiva), ', Error: ', num2str(error_regresiva)]);
disp(['Derivada central en x0 = ', num2str(df_central), ', Error: ', num2str(error_central)]);
disp(['Derivada exacta en x0 = ', num2str(df_exacta)]);

% Graficar la función y su derivada
x_vals = linspace(x0 - 2, x0 + 2, 100);  % Rango de valores de x
y_vals = arrayfun(f, x_vals);
dy_vals = arrayfun(df, x_vals);

figure;
subplot(2,1,1);
plot(x_vals, y_vals, 'b', 'LineWidth', 2);
hold on;
plot(x0, f(x0), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');  % Punto de evaluación
title(['Función f(x) = ', char(f_sym)]);
xlabel('x'); ylabel('f(x)');
grid on;
hold off;

subplot(2,1,2);
plot(x_vals, dy_vals, 'r', 'LineWidth', 2);
hold on;
plot(x0, df_exacta, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');  % Punto de evaluación
title(['Derivada f''(x) = ', char(df_sym)]);
xlabel('x'); ylabel('f''(x)');
grid on;
hold off;
