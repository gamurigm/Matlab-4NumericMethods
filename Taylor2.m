function TaylorPolinomioConError(f, x0, n, a, b)
    % f: función anónima, por ejemplo @(x) sin(x)
    % x0: punto de expansión
    % n: grado del polinomio de Taylor
    % a, b: intervalo para graficar [a, b]

    syms x;
    % Aproximación de Taylor
    taylor_poly = taylor(f(x), x, 'ExpansionPoint', x0, 'Order', n+1);

    % Evaluación numérica de la función original
    f_func = f; % Mantener como función anónima
    taylor_func = matlabFunction(taylor_poly);

    % Generar puntos para graficar
    x_vals = linspace(a, b, 1000);
    f_vals = arrayfun(f_func, x_vals); % Evaluar la función original
    taylor_vals = taylor_func(x_vals); % Evaluar el polinomio de Taylor

    % Cálculo del error absoluto
    error_vals = abs(f_vals - taylor_vals);

    % Gráficas
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

    % Mostrar detalles
    disp('Polinomio de Taylor:');
    disp(taylor_poly);
end
