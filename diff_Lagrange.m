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
    Dn = 0;
    
    % Calcular la derivada n de Pn(x)
    for i = 1:n
        
        P_i = LagrangeInt(X, f);
        dP_i = diff(P_i, x);
        
        % Sumar la derivada a la derivada total
        Dn = Dn + dP_i * f(i); % Multiplicar por los valores de f
      
    end
     
    Dn_val = double(subs(Dn, x, x0));
    disp(['Derivada de orden ', num2str(n), ' en x = ', num2str(x0), ' es: ', num2str(Dn_val)]);
    grid on 
    fplot(Dn, [min(X), max(X)], '-m');
    
    hold on;
    
    % Graficar el punto evaluado en la derivada
    plot(x0, Dn_val, 'ko', 'MarkerFaceColor', 'b', 'MarkerSize', 6); 
    title(['Derivada de orden ', num2str(n)]);
    xlabel('x');
    ylabel('f''(x)');

    legend('Pts. Interp', 'Polinomio', 'Pts. Eval','Location','best');   
end
