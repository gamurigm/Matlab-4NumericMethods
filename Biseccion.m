function [root, iter] = Biseccion(fun, int_ini, int_fin, tol, max_iter)
    % BISECCIÓN: Encuentra una raíz de una función en un intervalo usando el método de bisección.
    % Inputs:
    %   fun: función a evaluar (function handle o expresión simbólica)
    %   int_ini: límite inferior del intervalo
    %   int_fin: límite superior del intervalo
    %   tol: tolerancia de error (opcional, default 1e-6)
    %   max_iter: número máximo de iteraciones (opcional, default 100)
    % Outputs:
    %   root: raíz aproximada encontrada
    %   iter: número de iteraciones realizadas
    
    % Configurar valores predeterminados
    if nargin < 4, tol = 1e-6; end
    if nargin < 5, max_iter = 100; end

    % Convertir función simbólica a function handle si es necesario
    if isa(fun, 'sym')
        fun_handle = matlabFunction(fun);
    else
        fun_handle = fun;
    end

    % Verificar cambio de signo en los límites del intervalo
    if fun_handle(int_ini) * fun_handle(int_fin) > 0
        error('La función no cambia de signo en el intervalo proporcionado.');
    end

    % Inicializar variables
    iter = 0;
    root = (int_ini + int_fin) / 2;
    intervalos = []; % Para almacenar puntos medios

    % Mostrar encabezado de tabla de iteraciones
    %fprintf('\nIteración\tint_ini\t\tint_fin\t\tRaíz aproximada\t\tf(raíz)\n');
    fprintf('----------------------------------------------------------------------\n');

    % Método de bisección
    while abs(fun_handle(root)) > tol && iter < max_iter
        iter = iter + 1;

        % Imprimir progreso
       % fprintf('%d\t\t%.6f\t%.6f\t%.6f\t\t%.6f\n', iter, int_ini, int_fin, root, fun_handle(root));

        % Almacenar el punto medio actual
        intervalos = [intervalos, root];

        % Determinar nuevo subintervalo
        if fun_handle(int_ini) * fun_handle(root) < 0
            int_fin = root; % La raíz está en el intervalo izquierdo
        else
            int_ini = root; % La raíz está en el intervalo derecho
        end

        % Actualizar el punto medio
        root = (int_ini + int_fin) / 2;
    end

    % Comprobar convergencia
    if iter == max_iter
        warning('El método alcanzó el número máximo de iteraciones sin cumplir la tolerancia.');
    end

    % Mostrar resultado final
    fprintf('----------------------------------------------------------------------\n');
    fprintf('Raíz aproximada encontrada: %.6f\n', root);
    fprintf('Número de iteraciones realizadas: %d\n', iter);

    % Graficar la función y los puntos evaluados
    figure;
    
    % Crear un rango ampliado para graficar
    SF   = 5; % Factor para ampliar el rango
    x_min = int_ini - abs(int_ini) * SF;
    x_max = int_fin + abs(int_fin) * SF;
    x_range = linspace(x_min, x_max, 500); % Mayor resolución
    y_values = arrayfun(fun_handle, x_range);

    % Graficar la función
    plot(x_range, y_values, 'LineWidth', 1.5);
    hold on;
    grid on;

    % Línea horizontal en y = 0
    yline(0, '--k', 'LineWidth', 1);

    % Marcar los puntos evaluados y la raíz final
    plot(intervalos, arrayfun(fun_handle, intervalos), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
    plot(root, fun_handle(root), 'bo', 'MarkerSize', 10, 'MarkerFaceColor', 'b');

    % Configurar leyenda y etiquetas
    title('Método de Bisección');
    xlabel('x');
    ylabel('f(x)');
    legend('Función f(x)', 'Línea cero', 'Puntos evaluados', 'Raíz aproximada');
    hold off;
end
