function simpson_13()
    % Limpiar variables y pantalla
    clear all;
    clc;
    
    % Interfaz de usuario para recibir información
    disp('MÉTODO DE SIMPSON 1/3 COMPUESTO');
    disp('--------------------------------');
    
    % Solicitar la función a integrar
    func_str = input('Ingrese la función a integrar f(x) (ej: x^2+sin(x)): ', 's');
    f = str2func(['@(x) ' func_str]);
    
    % Solicitar límites de integración
    a = input('Ingrese el límite inferior de integración (a): ');
    b = input('Ingrese el límite superior de integración (b): ');
    
    % Solicitar número de subintervalos (pueden ser varios)
    n_input = input('Ingrese el número de subintervalos (puede ser un vector, ej: [2 4 6 8 10]): ');
    
    % Asegurarse de que n_input sea un vector (incluso si es un solo número)
    if isscalar(n_input)
        n_input = [n_input];
    end
    
    % Inicializar vector de resultados
    resultados = zeros(size(n_input));
    
    % Procesar cada número de subintervalos
    for idx = 1:length(n_input)
        n = n_input(idx);
        
        % Verificar que n sea par
        if mod(n, 2) ~= 0
            fprintf('ADVERTENCIA: El número de subintervalos %d no es par. Será ajustado a %d.\n', n, n+1);
            n = n + 1;
        end
        
        % Calcular el ancho de cada subintervalo
        h = (b - a) / n;
        
        % Crear vector de puntos x
        x = a:h:b;
        
        % Evaluar la función en todos los puntos
        y = zeros(size(x));
        for i = 1:length(x)
            y(i) = f(x(i));
        end
        
        % Aplicar fórmula de Simpson 1/3 compuesta
        suma = y(1) + y(n+1); % f(a) + f(b)
        
        for i = 2:2:n
            suma = suma + 4 * y(i); % Coeficiente 4 para índices pares
        end
        
        for i = 3:2:n
            suma = suma + 2 * y(i); % Coeficiente 2 para índices impares
        end
        
        % Resultado final
        resultados(idx) = (h/3) * suma;
        
        % Mostrar resultado para este n
        fprintf('\nPara n = %d subintervalos:\n', n);
        fprintf('La integral de %s desde %g hasta %g es: %g\n', func_str, a, b, resultados(idx));
        
        % Si es el último o uno de los especificados, hacer el gráfico
        if idx == length(n_input) || n == 6 || n == 10
            % Gráfico de la función y los puntos de evaluación
            figure;
            
            % Gráfico de la función con más puntos para suavizar
            xx = linspace(a, b, 1000);
            yy = zeros(size(xx));
            for i = 1:length(xx)
                yy(i) = f(xx(i));
            end
            plot(xx, yy, 'b-', 'LineWidth', 1.5);
            
            hold on;
            
            % Marcar los puntos de evaluación
            plot(x, y, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
            
            % Sombrear el área bajo la curva
            for i = 1:n
                xx_fill = linspace(x(i), x(i+1), 50);
                yy_fill = zeros(size(xx_fill));
                for j = 1:length(xx_fill)
                    yy_fill(j) = f(xx_fill(j));
                end
                fill([xx_fill, x(i+1), x(i)], [yy_fill, 0, 0], 'g', 'FaceAlpha', 0.2);
            end
            
            grid on;
            title(['Integración numérica por Simpson 1/3 compuesto de ' func_str ' (n=' num2str(n) ')']);
            xlabel('x');
            ylabel('f(x)');
            legend('Función f(x)', 'Puntos de evaluación', 'Área aproximada');
            
            % Mostrar información adicional en el gráfico
            text_info = sprintf('Integral ≈ %g\nn = %d subintervalos', resultados(idx), n);
            dim = [0.15 0.6 0.3 0.3];
            annotation('textbox', dim, 'String', text_info, 'EdgeColor', 'none', 'BackgroundColor', [1 1 1 0.7]);
        end
    end
    
    % Mostrar tabla de resultados si hay más de un n
    if length(n_input) > 1
        fprintf('\nResumen de resultados:\n');
        fprintf('---------------------------\n');
        fprintf('Subintervalos | Valor aproximado\n');
        fprintf('---------------------------\n');
        for idx = 1:length(n_input)
            n = n_input(idx);
            % Si n era impar y fue ajustado
            if mod(n_input(idx), 2) ~= 0
                n = n_input(idx) + 1;
                fprintf('%12d* | %15.8f\n', n_input(idx), resultados(idx));
            else
                fprintf('%12d | %15.8f\n', n, resultados(idx));
            end
        end
        fprintf('---------------------------\n');
        fprintf('* Número ajustado al siguiente número par\n');
    end
end