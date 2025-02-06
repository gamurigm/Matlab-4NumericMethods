function L = spline_cubico(x, y)
    % Inicialización
    clear; clc;

    % Datos iniciales
    x = [1.0000, 1.1000, 1.2000, 1.3000, 1.4000, 1.5000, 1.6000];
    y = [2.2874, 2.7726, 3.2768, 3.7979, 4.3327, 4.8759, 5.4209];

    % Gráfico inicial de los puntos
    hold on;
    plot(x, y, 'o', 'MarkerFaceColor', 'b', 'MarkerSize', 8); % Dibuja los puntos como círculos

    % Interpolación cúbica
    z = linspace(x(1), x(end), 100); % Genera puntos intermedios para la curva spline
    L = interp1(x, y, z, 'spline'); % Realiza la interpolación cúbica
    plot(z, L, 'r'); % Dibuja la curva interpolada en color rojo

    % Solicitar al usuario el valor de x a interpolar
    x_interp = input('Ingrese el valor de x a interpolar: ');

    % Verificar que x_interp esté dentro del rango de los datos
    if x_interp < min(x) || x_interp > max(x)
        disp('El valor ingresado está fuera del rango de los datos.');
    else
        % Interpolación para el punto específico ingresado
        Y = spline(x, y, x_interp); % Calcula el valor interpolado
        plot(x_interp, Y, '*b'); % Dibuja el punto interpolado en azul
        fprintf('El valor interpolado en x = %.4f es Y = %.4f\n', x_interp, Y);
    end

    % Configuración del gráfico
    axis([x(1), x(end), min(y) - 1, max(y) + 1]); % Ajusta los límites de los ejes
    grid on; % Agrega la cuadrícula al gráfico
    xlabel('Eje x'); % Etiqueta para el eje x
    ylabel('Eje y'); % Etiqueta para el eje y
    title('Interpolación cúbica spline'); % Título del gráfico

    % Finalización
    hold off;
end
