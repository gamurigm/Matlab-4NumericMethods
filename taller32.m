% % Evaluación de la segunda derivada de ln(x) en x=2 usando diferencias centrales
% % de 2do orden con diferentes valores de h
% 
% % Definimos el punto de evaluación
% x = 2;
% 
% % Valores de h a utilizar
% h_values = [0.09, 0.04, 0.01];
% 
% % Valor exacto de la segunda derivada de ln(x) en x=2
% % Para ln(x), la segunda derivada es -1/x^2
% exact_value = -1/(x^2);
% 
% % Inicializamos arrays para almacenar resultados
% approximations = zeros(size(h_values));
% errors = zeros(size(h_values));
% 
% % Calculamos las aproximaciones y errores para cada valor de h
% for i = 1:length(h_values)
%     h = h_values(i);
% 
%     % Evaluamos la función en los puntos necesarios
%     f_plus_h = log(x + h);
%     f_x = log(x);
%     f_minus_h = log(x - h);
% 
%     % Aplicamos la fórmula de diferencias centrales
%     second_derivative = (f_plus_h - 2*f_x + f_minus_h) / (h^2);
% 
%     % Guardamos la aproximación
%     approximations(i) = second_derivative;
% 
%     % Calculamos el error absoluto
%     errors(i) = abs(second_derivative - exact_value);
% end
% 
% % Mostramos la tabla de resultados según la plantilla solicitada
% disp('Tabla de error de la aprox. de dln(2)/dx')
% fprintf('der. aprox.    error \n')
% 
% for i = 1:length(h_values)
%     fprintf(' %9.6f    %.6f\n', approximations(i), errors(i))
% end

%PREGUNTA2
% format short
% %Datos del problema
% t=[0; 1; 2; 3; 4; 5; 6; 7; 8];
% y=[0; 60; 110; 170; 220; 270; 330; 390; 460];
% 
% %a)
% %Cálculo de la rapidez promedio en mph durante cada segmento
% velocidad = zeros(length(t)-1, 1);
% for i = 1:length(t)-1
%     velocidad(i) = (y(i+1) - y(i)) / (t(i+1) - t(i));
% end
% 
% %Imprimir tabla con velocidad promedio
% fprintf('Tiempo, horas  Distancia millas  Velocidad mph\n');
% fprintf('----------------------------------------\n');
% for i = 1:length(t)-1
%     fprintf('    %d-%d           %d              %d\n', t(i), t(i+1), y(i+1), velocidad(i));
% end
% 
% %b)
% %Verificar si alguna de las velocidades excede el límite de 75 mph
% limite_velocidad = 75;
% excede_limite = false;
% for i = 1:length(velocidad)
%     if velocidad(i) > limite_velocidad
%         excede_limite = true;
%         break;
%     end
% end
% 
% if excede_limite
%     fprintf('\nAlguna velocidad excede el límite\n');
% else
%     fprintf('\nNinguna velocidad excede el límite\n');
% end
% 
% %c)
% %Calcular y verificar si el promedio global excede el límite
% velocidad_promedio_global = (y(end) - y(1)) / (t(end) - t(1));
% fprintf('\nVelocidad promedio global: %.2f mph\n', velocidad_promedio_global);
% 
% if velocidad_promedio_global > limite_velocidad
%     fprintf('El promedio global excede el límite de rapidez\n');
% else
%     fprintf('El promedio global no excede el límite de rapidez\n');
% end
% 
% %d)
% %Gráfico
% tiempo_grafica = t(1:end-1);
% figure;
% plot(tiempo_grafica, velocidad, 'o-', 'LineWidth', 2);
% hold on;
% plot([tiempo_grafica(1), tiempo_grafica(end)], [limite_velocidad, limite_velocidad], 'r--');
% hold off;
% grid on;
% title('Velocidad promedio por segmento');
% xlabel('Tiempo inicial del segmento (horas)');
% ylabel('Velocidad (mph)');
% legend('Velocidad por segmento', 'Límite de velocidad (75 mph)');




%Pregunta 6

% Definir las funciones f(x) y g(x)
% Definir las funciones f(x) y g(x)
% f = @(x) exp(-cos(x)) + 2;
% g = @(x) x / cos(x^2); % Nueva definición de g(x)
% 
% % Encontrar los puntos de intersección usando fzero
% x1 = fzero(@(x) f(x) - g(x), -3); % Estimación inicial en -3
% x2 = fzero(@(x) f(x) - g(x), 0);  % Estimación inicial en 0
% 
% % Mostrar los puntos de intersección
% fprintf('Punto C de intersección: x1 = %.4f\n', x1);
% fprintf('Punto D de intersección: x2 = %.4f\n', x2);
% 
% % Calcular el área entre las curvas usando Simpson 3/8
% a = x1; % Punto de inicio
% b = x2; % Punto de fin
% n = 6;  % Número de subintervalos
% 
% % Definir la diferencia de las funciones (f(x) - g(x))
% h = (b - a) / n;
% 
% % Función para la diferencia f(x) - g(x)
% h_func = @(x) f(x) - g(x);
% 
% % Implementar Simpson 3/8
% integral = h * (h_func(a) + h_func(b)); % Primer y último término
% for i = 1:3:n-3
%     integral = integral + 3 * h * (h_func(a + i*h) + h_func(a + (i+1)*h)); % Términos intermedios
% end
% 
% % Imprimir el área con 4 decimales
% fprintf('Área_entre_curvas = %.4f \n', integral);


% 
% %PREGUNTA 4 
% 
% format short
% x=[0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8];
% y=[0, 2.1220, 3.0244, 3.2568, 3.1399, 2.8579, 2.5140, 2.1639, 1.8358];
% 
% %a) trapecios
% h = x(2)-x(1);
% suma = y(1) + y(end);
% for i=2:length(x)-1
%     suma = suma + 2*y(i);
% end
% It = (h/2)*suma
% 
% %b) Simpson
% h = x(2)-x(1);
% suma = y(1) + y(end);
% for i=2:2:length(x)-1
%     suma = suma + 4*y(i);
% end
% for i=3:2:length(x)-2
%     suma = suma + 2*y(i);
% end
% Is = (h/3)*suma
% 
% %c) Puntos medios
% h = x(2)-x(1);
% suma = 0;
% for i=1:length(x)-1
%     xmid = (x(i) + x(i+1))/2;
%     ymid = (y(i) + y(i+1))/2;
%     suma = suma + ymid;
% end
% Ipm = h * suma
% 
% % Para visualización
% figure(1)
% plot(x, y, 'bo-', 'LineWidth', 1.5);
% hold on;
% for i = 1:length(x)-1
%     fill([x(i), x(i+1), x(i+1), x(i)], [0, 0, y(i+1), y(i)], 'r', 'FaceAlpha', 0.3);
% end
% title('Método de los Trapecios');
% xlabel('x'); ylabel('f(x)');
% 
% figure(2)
% plot(x, y, 'bo', 'LineWidth', 1.5);
% hold on;
% for i = 1:2:length(x)-2
%     xx = linspace(x(i), x(i+2), 100);
%     p = polyfit([x(i), x(i+1), x(i+2)], [y(i), y(i+1), y(i+2)], 2);
%     yy = polyval(p, xx);
%     plot(xx, yy, 'g-', 'LineWidth', 2);
%     fill([xx, fliplr(xx)], [yy, zeros(size(xx))], 'g', 'FaceAlpha', 0.3);
% end
% title('Método de Simpson');
% xlabel('x'); ylabel('f(x)');
% 
% figure(3)
% plot(x, y, 'bo', 'LineWidth', 1.5);
% hold on;
% for i = 1:length(x)-1
%     xmid = (x(i) + x(i+1))/2;
%     ymid = (y(i) + y(i+1))/2;
%     rectangle('Position', [x(i), 0, h, ymid], 'FaceColor', [0, 0, 1, 0.3]);
% end
% title('Método de Puntos Medios');
% xlabel('x'); ylabel('f(x)');

% % Definición de las funciones
% f = @(x) exp(-cos(x)) + 2;  % f(x) = e^(-cos(x)) + 2
% g = @(x) x ./ cos(2*x);     % g(x) = x / cos(2x)
% 
% % Ecuación de intersección
% eqn = @(x) exp(-cos(x)) + 2 - (x ./ cos(2*x));  % f(x) - g(x) = 0
% 
% % Seleccionar dos intervalos iniciales para la búsqueda de las raíces
% x0_1 = -2;  % Primer valor inicial para buscar la primera raíz
% x0_2 = -1; % Segundo valor inicial para buscar la segunda raíz
% 
% % Usar fsolve para encontrar las raíces (intersecciones)
% options = optimset('Display', 'off');  % Opciones para no mostrar iteraciones
% x_intersection_1 = fsolve(eqn, x0_1, options);  % Resolver la ecuación para la primera raíz
% x_intersection_2 = fsolve(eqn, x0_2, options);  % Resolver la ecuación para la segunda raíz
% 
% % Evaluar las funciones f(x) y g(x) en los puntos de intersección
% y_intersection_1 = f(x_intersection_1);  % Evaluar en el primer punto de intersección
% y_intersection_2 = f(x_intersection_2);  % Evaluar en el segundo punto de intersección
% 
% % Imprimir los resultados en formato (x, y)
% fprintf('Punto de intersección C: (%.6f, %.6f)\n', x_intersection_1, y_intersection_1);
% fprintf('Punto de intersección D: (%.6f, %.6f)\n', x_intersection_2, y_intersection_2);


f = @(x) exp(-cos(x)) + 2;
g = @(x) x ./ cos(2*x);

eqn = @(x) exp(-cos(x)) + 2 - (x ./ cos(2*x));  

x0_1 = -2; 
x0_2 = -1; 


x_intersection_1 = fsolve(eqn, x0_1);
x_intersection_2 = fsolve(eqn, x0_2);

y_intersection_1 = f(x_intersection_1);
y_intersection_2 = f(x_intersection_2);

fprintf('Punto de intersección C: (%.6f, %.6f)\n', x_intersection_1, y_intersection_1);
fprintf('Punto de intersección D: (%.6f, %.6f)\n', x_intersection_2, y_intersection_2);

% Definir el intervalo
a = min(x_intersection_1, x_intersection_2);
b = max(x_intersection_1, x_intersection_2);

% Número de subintervalos (debe ser múltiplo de 3 para Simpson 3/8)
n = 6;
h = (b - a) / n;

% Aplicar la regla de Simpson 3/8 con 6 particiones
sum_area = abs(f(a) - g(a)) + abs(f(b) - g(b)); 

for i = 1:n-1
    x_i = a + i*h;
    if mod(i, 3) == 0
        sum_area = sum_area + 2 * abs(f(x_i) - g(x_i));  % Coeficiente 2 para múltiplos de 3
    else
        sum_area = sum_area + 3 * abs(f(x_i) - g(x_i));  % Coeficiente 3 para otros puntos
    end
end

area = (3 * h / 8) * sum_area;




fprintf('El área entre las funciones f(x) y g(x) en el intervalo [%.6f, %.6f] es: %.6f\n', a, b, area);
