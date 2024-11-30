function Taylor(f, x0, n, a, b)
    % Taylor: Calcula y grafica la serie de Taylor y los errores.
    %   f: función anónima, por ejemplo @(x) sin(x)
    %   x0: punto de expansión
    %   n: grado del polinomio de Taylor
    %   a, b: intervalo para graficar [a, b]
    close all
    syms x;
     
    if nargin < 5 
        % 1. Solicitar la función
    f_input = input('Ingrese la función f(x) (ejemplo: @(x) sin(x)): ', 's');
    f = str2func(f_input); % Convertir la entrada en una función anónima
    
    % 2. Solicitar el valor de x0 (punto de expansión)
    x0 = input('Ingrese el valor de x0 (punto de expansión): ');
    
    % 3. Solicitar el número de términos de la serie
    n = input('Ingrese el número de términos de la serie de Taylor (n): ');
    
    % 4. Solicitar el intervalo para graficar
    disp('Defina el intervalo para graficar [a, b]:');
    a = input('Ingrese el valor de a: ');
    b = input('Ingrese el valor de b: ');
    
    % 5. Solicitar un valor de x para evaluar
    x_eval = input('Ingrese un valor de x para evaluar la función y la serie de Taylor: ');
    end
    T = 0;

    % Calcular cada término de la serie de Taylor
    for k = 0:n
        derivada = diff(f(x), x, k);           % k-ésima derivada de f(x)
        termino = subs(derivada, x, x0) * (x - x0)^k / factorial(k); % Término de Taylor
        T = T + termino;                    
    end

    disp('Polinomio de Taylor:');
    disp(T);

    % Convertir funciones simbólicas a evaluables
    f_func = f;                              
    Serie = matlabFunction(T);             

    % Calcular el valor de la función en el punto x0
    f_at_x0 = f_func(x0);                     
    taylor_at_x0 = Serie(x0);   

     % Generar puntos para graficar
    x_vals = linspace(a, b, 1000);
    
    f_vals = arrayfun(f_func, x_vals);        % Evaluar la función original
    taylor_vals = Serie(x_vals);              % Evaluar el polinomio de Taylor

    % Mostrar los valores en x0
    fprintf('Valor de la función en x0 = %f: %.8f\n', x0, f_at_x0);
    fprintf('Valor del polinomio de Taylor en x0 = %f: %.8f\n', x0, taylor_at_x0);

    [e_abs_vals, e_rel_vals] = calcularErrores(taylor_vals, f_at_x0);
    
    % Graficar la función original, la serie de Taylor y el error absoluto
    figure;
    hold on;
    plot(x_vals, f_vals, 'b-', 'LineWidth', 2, 'DisplayName', 'Función Original');
    plot(x_vals, taylor_vals, 'r--', 'LineWidth', 2, 'DisplayName', ['Taylor (grado ', num2str(n), ')']);
    plot(x_vals, e_abs_vals, 'k-.', 'LineWidth', 1.5, 'DisplayName', 'Error Absoluto');

    % Añadir los puntos evaluados en x0
    plot(x0, f_at_x0, 'bo', 'MarkerFaceColor', 'b', 'DisplayName', ['f(x0) = ' num2str(f_at_x0)]);
    plot(x0, taylor_at_x0, 'ro', 'MarkerFaceColor', 'r', 'DisplayName', ['T(x0) = ' num2str(taylor_at_x0)]);

    xlabel('x');
    ylabel('y');
    legend('Location', 'Best');
    title(['Aproximación de Taylor en x_0 = ', num2str(x0)]);
    grid on;
    hold off;

    fprintf('Error absoluto [%f, %f]: %f\n', a, b, min(e_abs_vals));
    fprintf('Error relativo [%f, %f]: %.8f%%\n', a, b, min(e_rel_vals));
end
