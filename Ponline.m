% Problema fuerzas estructura reticulada
% Incógnitas F1 F2 F3 F4 F5 F6 F7 H V1 V2

% Coeficientes:
A = [
    sind(45), 0, 0, 0, 0, 0, 0, 0, 1, 0;
    cosd(45), 1, 0, 0, 0, 0, 0, 1, 0, 0;
    -sind(45), 0, -sind(70), 0, 0, 0, 0, 0, 0, 0;
    -cosd(45), 0, cosd(70), 1, 0, 0, 0, 0, 0, 0;
    0, 0, sind(70), 0, sind(60), 0, 0, 0, 0, 0;
    0, -1, -cosd(70), 0, cosd(60), 0, 1, 0, 0, 0;
    0, 0, 0, 0, -sind(60), -sind(70), 0, 0, 0, 0;
    0, 0, 0, -1, -cosd(60), cosd(70), 0, 0, 0, 0;
    0, 0, 0, 0, 0, sind(70), 0, 0, 0, 1;
    0, 0, 0, 0, 0, -cosd(70), -1, 0, 0, 0
];

b = [
    0;
    0;
    250;  % Cambio de signo aquí
    0;
    0;
    0;
    250;  % Cambio de signo aquí
    0;
    0;
    0
];

% Método de Gauss parcial
n = length(b);
for k = 1:n-1
    % Pivoteo parcial
    [maxval, maxidx] = max(abs(A(k:n, k)));
    maxidx = maxidx + k - 1;
    if maxidx ~= k
        A([k, maxidx], :) = A([maxidx, k], :);
        b([k, maxidx]) = b([maxidx, k]);
    end
    
    % Eliminación
    for i = k+1:n
        factor = A(i, k) / A(k, k);
        A(i, k:n) = A(i, k:n) - factor * A(k, k:n);
        b(i) = b(i) - factor * b(k);
    end
end

% Sustitución hacia atrás
x = zeros(n, 1);
x(n) = b(n) / A(n, n);
for i = n-1:-1:1
    x(i) = (b(i) - A(i, i+1:n) * x(i+1:n)) / A(i, i);
end

% Resultados
F1 = x(1);
F2 = x(2);
F3 = x(3);
F4 = x(4);
F5 = x(5);
F6 = x(6);
F7 = x(7);
H = x(8);
V1 = x(9);
V2 = x(10);

% Comprobación
disp('1. Comprobación b= ')
b_comprobacion = A * x;
disp(b_comprobacion);

disp('2. Valores de las fuerzas')
fprintf('F1 = %.3f\n', F1);
fprintf('F2 = %.3f\n', F2);
fprintf('F3 = %.3f\n', F3);
fprintf('F4 = %.3f\n', F4);
fprintf('F5 = %.3f\n', F5);
fprintf('F6 = %.3f\n', F6);
fprintf('F7 = %.3f\n', F7);
fprintf('H = %.0f\n', H);  % Mostrar H sin decimales
fprintf('V1 = %.3f\n', V1);
fprintf('V2 = %.3f\n', V2);
disp('');

disp('3. Fuerzas en el Nodo 4')
disp('Eje x:')
fprintf(' F4 = %.2f kg\n', F4);
fprintf(' F5x = %.2f kg\n', F5 * cosd(60));
fprintf(' F6x = %.2f kg\n', F6 * cosd(70));
disp('Eje y:')
fprintf(' F5y = %.2f kg\n', F5 * sind(60));  % Positivo (hacia arriba)
fprintf(' F6y = %.2f kg\n', -F6 * sind(70)); % Negativo (hacia abajo% Problema fuerzas estructura reticulada
% Incógnitas F1 F2 F3 F4 F5 F6 F7 H V1 V2

% Coeficientes:
A = [
    sind(45), 0, 0, 0, 0, 0, 0, 0, 1, 0;
    cosd(45), 1, 0, 0, 0, 0, 0, 1, 0, 0;
    -sind(45), 0, -sind(70), 0, 0, 0, 0, 0, 0, 0;
    -cosd(45), 0, cosd(70), 1, 0, 0, 0, 0, 0, 0;
    0, 0, sind(70), 0, sind(60), 0, 0, 0, 0, 0;
    0, -1, -cosd(70), 0, cosd(60), 0, 1, 0, 0, 0;
    0, 0, 0, 0, -sind(60), -sind(70), 0, 0, 0, 0;
    0, 0, 0, -1, -cosd(60), cosd(70), 0, 0, 0, 0;
    0, 0, 0, 0, 0, sind(70), 0, 0, 0, 1;
    0, 0, 0, 0, 0, -cosd(70), -1, 0, 0, 0
];

b = [
    0;
    0;
    250;  % Cambio de signo aquí
    0;
    0;
    0;
    250;  % Cambio de signo aquí
    0;
    0;
    0
];

% Método de Gauss parcial
n = length(b);
for k = 1:n-1
    % Pivoteo parcial
    [maxval, maxidx] = max(abs(A(k:n, k)));
    maxidx = maxidx + k - 1;
    if maxidx ~= k
        A([k, maxidx], :) = A([maxidx, k], :);
        b([k, maxidx]) = b([maxidx, k]);
    end
    
    % Eliminación
    for i = k+1:n
        factor = A(i, k) / A(k, k);
        A(i, k:n) = A(i, k:n) - factor * A(k, k:n);
        b(i) = b(i) - factor * b(k);
    end
end

% Sustitución hacia atrás
x = zeros(n, 1);
x(n) = b(n) / A(n, n);
for i = n-1:-1:1
    x(i) = (b(i) - A(i, i+1:n) * x(i+1:n)) / A(i, i);
end

% Resultados
F1 = x(1);
F2 = x(2);
F3 = x(3);
F4 = x(4);
F5 = x(5);
F6 = x(6);
F7 = x(7);
H = x(8);
V1 = x(9);
V2 = x(10);

% Comprobación
disp('1. Comprobación b=A*x')
b_comprobacion = A * x;
disp(b_comprobacion);

disp('2. Valores de las fuerzas')
fprintf('F1 = %.3f\n', F1);
fprintf('F2 = %.3f\n', F2);
fprintf('F3 = %.3f\n', F3);
fprintf('F4 = %.3f\n', F4);
fprintf('F5 = %.3f\n', F5);
fprintf('F6 = %.3f\n', F6);
fprintf('F7 = %.3f\n', F7);
fprintf('H = %.0f\n', H);  % Mostrar H sin decimales
fprintf('V1 = %.3f\n', V1);
fprintf('V2 = %.3f\n', V2);
disp('');

disp('3. Fuerzas en el Nodo 4')
disp('Eje x:')
fprintf(' F4 = %.2f kg\n', F4);
fprintf(' F5x = %.2f kg\n', F5 * cosd(60));
fprintf(' F6x = %.2f kg\n', F6 * cosd(70));
disp('Eje y:')
fprintf(' F5y = %.2f kg\n', -F5 * sind(60));  % Negativo (hacia abajo)
fprintf(' F6y = %.2f kg\n', -F6 * sind(70));   % Positivo (hacia arriba)