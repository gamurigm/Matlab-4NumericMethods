clc; clear; close all;
syms x h

% Pedir la función simbólica al usuario
f_str = input('Ingrese la función en términos de x (por ejemplo, sqrt(x)): ', 's');
f = str2sym(f_str);  % Convertir la cadena a una expresión simbólica

% Pedir el valor del punto de evaluación, el orden de la derivada y el tipo de derivada
x0 = input('Ingrese el valor de x0: ');
n = input('Ingrese el orden de la derivada deseada: ');
tipo_derivada = input('Ingrese el tipo de derivada (1: Progresiva, 2: Regresiva, 3: Central): ');

% Inicializar derivada
if tipo_derivada == 1
    % Derivada progresiva
    df = (subs(f, x, x + h) - f) / h;
elseif tipo_derivada == 2
    % Derivada regresiva
    df = (f - subs(f, x, x - h)) / h;
elseif tipo_derivada == 3
    % Derivada central
    df = (subs(f, x, x + h) - subs(f, x, x - h)) / (2 * h);
else
    error('Opción no válida para el tipo de derivada.');
end

disp(['Derivada de orden 1: ', char(simplify(df))]); % Mostrar la primera derivada

% Aplicar la definición recursivamente para derivadas superiores
for k = 2:n
    if tipo_derivada == 1
        % Derivada progresiva
        df = (subs(df, x, x + h) - df) / h;
    elseif tipo_derivada == 2
        % Derivada regresiva
        df = (subs(df, x, x) - subs(df, x, x - h)) / h;
    elseif tipo_derivada == 3
        % Derivada central
        df = (subs(df, x, x + h) - subs(df, x, x - h)) / (2 * h);
    end
    disp(['Derivada de orden ', num2str(k), ': ', char(simplify(df))]); % Mostrar
end
