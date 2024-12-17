function [root, iterations] = Secante(x0, x1, n, tol)
    % Método de la Secante (con gráfica de puntos)
    close all
    syms x;
    if nargin < 4, tol = 1e-6; end
    if nargin < 3, n = 100; end 
    fprintf('Introduce la función simbólica f(x):\n');
    fprintf('Ejemplo: x^2 - 4\n');
    f_sym = input('f(x) = ', 's');
    f_sym = str2sym(f_sym);
    f = matlabFunction(f_sym);
    fprintf('Iteración\tx0\t\tx1\t\tRaíz\t\tf(Raíz)\n');
    
    iterations = 0;
    root = 0;
    
    % Preparar figura para gráfica
    figure;
    hold on;

    % Crear rango para gráfica de la función
    x_min = min(x0, x1) - 5; % Ajustar margen izquierdo
    x_max = max(x0, x1) + 5; % Ajustar margen derecho
    x_range = linspace(x_min, x_max, 500); % Aumentar resolución
    y_range = f(x_range);

    % Graficar función original
    plot(x_range, y_range, 'b-', 'LineWidth', 2);
    xlabel('x');
    ylabel('f(x)');
    title('Método de la Secante');
    grid on;

    x_points = [x0, x1];
    y_points = [f(x0), f(x1)];

    % Iteraciones del método de la secante
    for i = 1:n
        iterations = iterations + 1;
        x2 = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));
        root = x2;
        
        % Almacenar y graficar punto de iteración en rojo
        x_points(end+1) = x2;
        y_points(end+1) = f(x2);
        scatter(x2, f(x2), 'r', 'filled');
        
        fprintf('%d\t\t%.6f\t%.6f\t%.6f\t%.6e\n', i, x0, x1, x2, f(x2));
        
        if abs(x1 - x2) < tol
            fprintf('Convergencia alcanzada\n');
            fprintf('Número total de iteraciones: %d\n', iterations);
            fprintf('Raíz encontrada: %.3f\n', root);
            
            % Graficar raíz en negro y más grande
            scatter(root, f(root), 'k', 'filled', 'SizeData', 100);
            drawnow;
            plot(x_points, y_points, 'r--' );
            legend('Función Original', 'Puntos de Iteración');
            return;
        end
        x0 = x1;
        x1 = x2;
    end
    
    fprintf('El método no convergió en %d iteraciones\n', n);
    fprintf('Número total de iteraciones: %d\n', iterations);
    fprintf('Raíz aproximada: %.6f\n', root);
    
    % Graficar raíz en negro y más grande
    scatter(root, f(root), 'k', 'filled', 'SizeData', 100);
    plot(x_points, y_points, 'r--');
    legend('Función Original', 'Puntos de Iteración');
end
