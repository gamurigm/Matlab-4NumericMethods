%clc; clear; close all;
% syms x h f(x) y
% 
% % Definir la función simbólica
% f(x) =  sqrt(x);
% 
% % Parámetros
% x0 = 2;   % Punto de evaluación
% n = 3;    % Orden de la derivada deseada
% 
% % Inicializar derivada simbólica con la primera derivada por definición
% df = (f(x + h) - f(x)) / h;
% disp(['Derivada de orden 1: ', char(simplify(df))]); % Mostrar primera derivada
% 
% % Aplicar la definición recursivamente para órdenes superiores
% for k = 2:n
%     df = (subs(df, x, x + h) - df) / h; % Aplicar la definición sobre la derivada previa
%     disp(['Derivada de orden ', num2str(k), ': ', char(simplify(df))]); % Mostrar
% end

clc; clear; close all;

func_str = input('Introduce la función en términos de x (por ejemplo, x^3): ', 's');
f = str2func(['@(x) ', func_str]); % Convertir la cadena a una función
x0 = input('Introduce el valor de x0: ');
n = input('Introduce el orden de la derivada deseada: ');
h_value = input('Introduce el valor de h: ');

syms x h
df = (f(x + h) - f(x)) / h;  
disp(['Derivada de orden 1: ', char(simplify(df))]); 

% Guardar todas las derivadas
all_df = sym(zeros(1,n));
all_df  (1) = simplify(df);

for k = 2:n
    df = (subs(df, x, x + h) - df) / h; 
    all_df(k) = simplify(df); 
    disp(['Derivada de orden ', num2str(k), ': ', char(simplify(df))]); 
end

numeric_df = zeros(1, n);
for k = 1:n
    numeric_df(k) = double(subs(all_df(k), {x, h}, {x0, h_value}));
    disp(['Valor numérico de la derivada de orden ', num2str(k), ' en x0 = ', num2str(x0), ': ', num2str(numeric_df(k))]);
end