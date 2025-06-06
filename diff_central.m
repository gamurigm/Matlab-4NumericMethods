clc; clear; close all;

func_str = input('Introduce la función en términos de x (por ejemplo, x^3): ', 's');
f = str2func(['@(x) ', func_str]);
x0 = input('Introduce el valor de x0: ');
n = input('Introduce el orden de la derivada deseada: ');
h_value = input('Introduce el valor de h: ');

syms x h
df = (f(x + h) - f(x - h)) / (2*h);  
disp(['Derivada de orden 1: ', char(simplify(df))]); 


all_df = sym(zeros(1,n));  % Guardar las derivadas
all_df  (1) = simplify(df);

for k = 2:n
    df = (subs(df, x, x + h) - subs(df,x, x - h)) / (2*h); 
    all_df(k) = simplify(df); 
    disp(['Derivada de orden ', num2str(k), ': ', char(simplify(df))]); 
end

numeric_df = zeros(1, n);
for k = 1:n
    numeric_df(k) = double(subs(all_df(k), {x, h}, {x0, h_value}));
    disp(['Valor numérico de la derivada de orden ', num2str(k), ' en x0 = ', num2str(x0), ': ', num2str(numeric_df(k))]);
end
