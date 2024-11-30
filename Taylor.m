function TaylorConError(f, x0, n, a, b)
    % TaylorConError: Calcula y grafica la serie de Taylor y el error absoluto/relativo.
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
        T = T + termino;                      % Sumar el término al polinomio
    end

    disp('Polinomio de Taylor:');
    disp(T);

    % Convertir funciones simbólicas a evaluables
    f_func = f;                               
    taylor_func = matlabFunction(T);  

    % Generar puntos para graficar
    x_vals = linspace(a, b, 1000);
    f_vals = arrayfun(f_func, x_vals);        % Evaluar la función original
    taylor_vals = taylor_func(x_vals);        % Evaluar el polinomio de Taylor

    % Calcular el error absoluto
    error_vals = abs(f_vals - taylor_vals);

    % Calcular errores en un punto clave (ej. el centro del intervalo)
    punto = x0; % Puedes cambiarlo a otro valor si deseas
    valor_real = double(f_func(punto));
    valor_taylor = double(taylor_func(punto));
    [e_abs, e_rel] = calcularErrores(valor_taylor, valor_real);

    % Graficar la función original, la serie de Taylor y el error absoluto
    figure;
    hold on;
    plot(x_vals, f_vals, 'b-', 'LineWidth', 2, 'DisplayName', 'Función Original');
    plot(x_vals, taylor_vals, 'r--', 'LineWidth', 2, 'DisplayName', ['Taylor (grado ', num2str(n), ')']);
    plot(x_vals, error_vals, 'k-.', 'LineWidth', 1.5, 'DisplayName', 'Error Absoluto');
    xlabel('x');
    ylabel('y');
    legend('Location', 'Best');
    title(['Aproximación de Taylor en x_0 = ', num2str(x0)]);
    grid on;
    hold off;

    % Mostrar en consola información adicional
    fprintf('Valor real en x_0 = %.2f: %.8f\n', punto, valor_real);
    fprintf('Valor de Taylor en x_0 = %.2f: %.8f\n', punto, valor_taylor);
end
