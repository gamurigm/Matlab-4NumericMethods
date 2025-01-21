%% ComparacionMetodosSEL.m
% Script principal para comparar métodos de solución de sistemas de ecuaciones lineales
clear all;
close all;
clc;

% Parámetros de la comparación
muestras = 100;
tamanos = [3, 10, 30, 100, 200];
tiempos = zeros(length(tamanos), 3);

% Realizar comparación para cada tamaño
for i = 1:length(tamanos)
    tiempos(i,:) = mean(CalcularTiempos(tamanos(i), muestras));
end

% Convertir a milisegundos
tiempos_ms = tiempos * 1000;

% Crear gráfica
figure('Name', 'Comparación de Métodos', 'NumberTitle', 'off');
metodos = {'Gauss Parcial', 'Descomposición LU', 'Inversa'};
estilos = {'-o', '-s', '-^'};
colores = {'#0072BD', '#D95319', '#77AC30'};

for i = 1:3
    semilogy(tamanos, tiempos_ms(:,i), estilos{i}, 'Color', colores{i}, ...
        'LineWidth', 2, 'MarkerFaceColor', colores{i}, ...
        'DisplayName', metodos{i});
    hold on;
end

title('Comparación de Eficiencia - Métodos de Solución', 'FontSize', 14);
xlabel('Tamaño del Sistema (n×n)', 'FontSize', 12);
ylabel('Tiempo de Ejecución (ms) - Escala Log', 'FontSize', 12);
legend('Location', 'northwest', 'FontSize', 10);
grid on;
set(gca, 'YScale', 'log');

% Crear tabla de resultados
tabla_tiempos = array2table([tamanos' tiempos_ms], ...
    'VariableNames', ['Tamano', metodos]);
disp('Tiempos de ejecución (ms):');
disp(tabla_tiempos);

%% Funciones auxiliares
function T = CalcularTiempos(n, muestras)
    T = zeros(muestras, 3);
    
    for i = 1:muestras
        [A, b] = CrearSistema(n);
        
        tic;
        MetodoGauss(A, b);
        T(i,1) = toc;
        
        tic;
        MetodoLU(A, b);
        T(i,2) = toc;
        
        tic;
        MetodoInversa(A, b);
        T(i,3) = toc;
    end
end

function [A, b] = CrearSistema(n)
    A = randi([-10 10], n);
    b = randi([-10 10], n, 1);
    
    % Asegurar dominancia diagonal
    for i = 1:n
        A(i,i) = sum(abs(A(i,:))) + randi([1 10]);
    end
end

function x = MetodoGauss(A, b)
    [n, ~] = size(A);
    x = zeros(n,1);
    
    % Matriz Aumentada
    M = [A b];
    
    % Eliminación hacia adelante
    for i = 1:n-1
        % Pivoteo parcial
        [~, indice_max] = max(abs(M(i:n,i)));
        indice_max = indice_max + i - 1;
        if indice_max ~= i
            M([i,indice_max],:) = M([indice_max,i],:);
        end
        
        for j = i+1:n
            factor = M(j,i)/M(i,i);
            M(j,:) = M(j,:) - factor * M(i,:);
        end
    end
    
    % Sustitución hacia atrás
    for i = n:-1:1
        x(i) = M(i,n+1);
        for j = i+1:n
            x(i) = x(i) - M(i,j)*x(j);
        end
        x(i) = x(i)/M(i,i);
    end
end

function x = MetodoLU(A, b)
    [n, ~] = size(A);
    
    % Factorización LU
    L = eye(n);
    U = A;
    for i = 1:n-1
        for j = i+1:n
            L(j,i) = U(j,i)/U(i,i);
            U(j,:) = U(j,:) - L(j,i)*U(i,:);
        end
    end
    
    % Resolver Ly = b
    y = zeros(n,1);
    for i = 1:n
        y(i) = b(i);
        for j = 1:i-1
            y(i) = y(i) - L(i,j)*y(j);
        end
    end
    
    % Resolver Ux = y
    x = zeros(n,1);
    for i = n:-1:1
        x(i) = y(i);
        for j = i+1:n
            x(i) = x(i) - U(i,j)*x(j);
        end
        x(i) = x(i)/U(i,i);
    end
end

function x = MetodoInversa(A, b)
    x = inv(A)*b;
end