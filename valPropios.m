% Solicitar al usuario que ingrese la matriz
disp('Ingresa la matriz A en el formato [a b c; d e f; g h i; ...]');
A = input('Ingrese la matriz A: ');

% Calcular los valores propios de la matriz
valores_propios = eig(A);

% Mostrar los valores propios
disp('Los valores propios de la matriz A son:');
disp(valores_propios);
