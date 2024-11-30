function TaylorConError(f, x0, n, a, b)
    % TaylorConError: Calcula y grafica la serie de Taylor y los errores.
    %   f: función anónima, por ejemplo @(x) sin(x)
    %   x0: punto de expansión
    %   n: grado del polinomio de Taylor
    %   a, b: intervalo para graficar [a, b]

    syms x;

    % Inicializar el polinomio de Taylor
    T = 0;

    % Calcular cada término de la serie de Taylor
    for k = 0:n
        derivada = diff(f(x), x, k);           % k-ésima derivada de f(x)
        termino = subs(derivada, x, x0) * (x - x0)^k / factorial(k); % Término de Taylor
        T = T + termino;                    
    end

    % Mostrar el polinomio de Taylor
    disp('Polinomio de Taylor:');
    disp(T);

    % Convertir funciones simbólicas a evaluables
    f_func = f;                               % Función original (anónima)
    Serie = matlabFunction(T);                % Polinomio de Taylor

    % Calcular el valor de la función en el punto x0
    f_at_x0 = f_func(x0);                     % Evaluar la función original en x0
    taylor_at_x0 = Serie(x0);                 % Evaluar el polinomio de Taylor en x0

    % Mostrar los valores en x0
    fprintf('Valor de la función en x0 = %f: %.4f\n', x0, f_at_x0);
    fprintf('Valor del polinomio de Taylor en x0 = %f: %.4f\n', x0, taylor_at_x0);

    % Generar puntos para graficar
    x_vals = linspace(a, b, 100000);
    f_vals = arrayfun(f_func, x_vals);        % Evaluar la función original
    taylor_vals = Serie(x_vals);              % Evaluar el polinomio de Taylor

    % Calcular errores absoluto y relativo
    e_abs_vals = zeros(size(x_vals));
    e_rel_vals = zeros(size(x_vals));
    for i = 1:length(x_vals)
        [e_abs_vals(i), e_rel_vals(i)] = calcularErrores(taylor_vals(i), f_vals(i));
    end

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

    % Mostrar en consola información adicional
    fprintf('Error absoluto máximo en [%f, %f]: %f\n', a, b, max(e_abs_vals));
    fprintf('Error relativo máximo en [%f, %f]: %.4f%%\n', a, b, max(e_rel_vals));
end
