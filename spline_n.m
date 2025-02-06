function spline_n(x, y, n)
    % Verificar que el orden es válido (debe ser al menos 2)
    if n < 2
        error('El orden del spline debe ser al menos 2.');
    end
    
    % Gráfico de los puntos originales
    figure;
    hold on;
    plot(x, y, 'o', 'MarkerFaceColor', 'b', 'MarkerSize', 8); % Puntos de datos

    % Generar spline de orden n usando spapi
    sp = spapi(n, x, y);

    % Evaluar spline en un rango de valores intermedios
    z = linspace(min(x), max(x), 100);
    S = fnval(sp, z);
    
    % Graficar el spline interpolado
    plot(z, S, 'r', 'LineWidth', 2);
    
    % Solicitar al usuario un valor de x a interpolar
    x_interp = input('Ingrese el valor de x a interpolar: ');

    % Verificar que x_interp esté dentro del rango de los datos
    if x_interp < min(x) || x_interp > max(x)
        disp('El valor ingresado está fuera del rango de los datos.');
    else
        % Evaluar spline en el punto ingresado
        Y_interp = fnval(sp, x_interp);
        plot(x_interp, Y_interp, '*b', 'MarkerSize', 10); % Punto interpolado
        fprintf('El valor interpolado en x = %.4f es Y = %.4f\n', x_interp, Y_interp);
    end
    
    % Configuración del gráfico
    grid on;
    xlabel('Eje x');
    ylabel('Eje y');
    title(['Spline de orden ', num2str(n)]);
    legend('Datos originales', 'Spline Interpolado', 'Ubicación', 'Best');
    
    hold off;
end
