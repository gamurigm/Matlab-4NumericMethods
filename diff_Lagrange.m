function Dn = diff_Lagrange()
    clc; clear; close all;
    X = input('Ingrese los puntos X como un vector: ');
    f = input('Ingrese los valores de f como vector: ');
    n = input('Ingrese el orden de la derivada deseada: ');
    x0 = input('Ingrese el valor de x0 a evaluar la derivada: ');
  
    if length(X) ~= length(f)
        error('Los vectores X y f deben tener la misma longitud.');
    end

    syms x;
    
    % Obtener el polinomio de interpolación de Lagrange
    L = LagrangeInt(X, f);
    
    % Calcular la derivada de orden n
    Dn = diff(L, x, n);
    
    % Evaluar la derivada en x0
    Dn_val = double(subs(Dn, x, x0));
    
    % Mostrar el resultado
    disp(['Derivada de orden ', num2str(n), ' en x = ', num2str(x0), ' es: ', num2str(Dn_val)]);
    
    % Graficar
    fplot(Dn, [min(X) max(X)], 'm-', 'LineWidth', 1);
    hold on;
   
    plot(x0, Dn_val, 'ro', 'MarkerFaceColor', 'b'); % Punto evaluado
    
    grid on;
    legend('Puntos de Interpolación', 'Polinomio de Lagrange', 'Location', 'best');
    title('Interpolación de Lagrange y su derivada');
    xlabel('x'); ylabel('f(x)');
    hold off;
end
