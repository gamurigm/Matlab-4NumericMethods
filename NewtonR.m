function [root, iter, errores] = NewtonR(x0, tol, max_iter)
    % Definición de la función f(x)
    f = @(x) 2*x^3 - 11;
    
    % Definición de la derivada de f(x)
    df = @(x) 6*x^2;
    
    % Valores por defecto
    if nargin < 2, tol = 1e-10; end % Tolerancia más pequeña
    if nargin < 3, max_iter = 50; end % Máximo de iteraciones
    
    % Inicialización de variables
    iter = 0;
    root = x0;
    errores = [];
    
    % Cabecera de impresión
    fprintf('\nIteración\tx\t\tf(x)\t\tError Absoluto\n');
    fprintf('----------------------------------------------------------------------\n');
    
    % Método de Newton-Raphson con criterios de parada mejorados
    while iter < max_iter
        iter = iter + 1;
        
        % Evaluar función y derivada
        f_val = f(root);
        df_val = df(root);
        
        % Verificación de derivada
        if abs(df_val) < eps
            warning('Derivada cerca de cero. Posible problema de convergencia.');
            break;
        end
        
        % Cálculo del nuevo punto
        x_next = root - f_val / df_val;
        
        % Cálculo de error absoluto (más preciso que el error relativo)
        error_abs = abs(f_val);
        errores = [errores, error_abs];
        
        % Imprimir progreso
        fprintf('%d\t\t%.8f\t%.8f\t%.8e\n', iter, root, f_val, error_abs);
        
        % Criterios de parada mejorados
        if error_abs < tol
            break;
        end
        
        % Verificación de convergencia
        if iter > 1 && abs(x_next - root) < eps
            break;
        end
        
        % Actualizar raíz
        root = x_next;
    end
    
    % Resultado final
    fprintf('----------------------------------------------------------------------\n');
    fprintf('Raíz aproximada: %.10f\n', root);
    fprintf('Número de iteraciones: %d\n', iter);
    fprintf('Error final: %.10e\n', errores(end));
    
    % Gráfica de convergencia
    figure;
    semilogy(1:length(errores), errores, '-o', 'LineWidth', 1.5, 'MarkerFaceColor', 'r');
    title('Convergencia del Método de Newton-Raphson');
    xlabel('Iteración');
    ylabel('Error Absoluto (escala logarítmica)');
    grid on;
    
    % Gráfica de la función
    figure;
    x_range = linspace(root-5, root+5, 300);
    y_values = arrayfun(f, x_range);
    plot(x_range, y_values, 'LineWidth', 1.5);
    hold on;
    yline(0, 'r--');
    plot(root, f(root), 'ro', 'MarkerFaceColor', 'r');
    title('Función y Raíz Encontrada');
    xlabel('x');
    ylabel('f(x)');
    grid on;
end

% Ejemplo de uso
%[root, iter, errores] = NewtonRaphsonOptimizado(3, 1e-10, 50);