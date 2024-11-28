% Solicita el valor de la temperatura al usuario
x = input('Ingresar el valor de la temperatura: ');

% Verifica si la temperatura ingresada es correcta
if x == 5
    fprintf('La temperatura del sistema es correcta, x = %d\n', x);
else
    fprintf('La temperatura del sistema no es correcta, x = %d\n', x);
end
