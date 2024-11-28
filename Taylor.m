function [T] = Taylor(f, x0, n)
    % TAYLOR: Calcula y grafica la serie de Taylor de una función simbólica.
    %   f: función ej: 'sin(x)'
    %   x0: punto a evaluar.
    %   n: número de términos;
    %   T: Serie de Taylor simbólica.
    
    syms x;
    % 
       T = 0;
    if nargin < 3
        f = input("Ingrese la función f (en términos de x): ", 's');
        f = str2sym(f); % Convertir la función ingresada a simbólica
        x0 = input("Ingrese el punto x0: ");
        n = input("Ingrese el número de términos n: ");
    end
    % for k=0:n
    %     derivada=diff(f);
    %     T=T + subs(derivada, x0)*((x-x0)^k)/factorial(k);
    %     f=derivada;
    % end
    for k = 0:n
        derivada = diff(f, x, k);  % Calcular la k-ésima derivada de f
        termino = subs(derivada, x, x0) * (x - x0)^k / factorial(k);  % Término de Taylor
        T = T + termino;  
    end
    
        disp('La serie de Taylor es:');
        disp(T);
    
         % Evaluar la función real y la serie de Taylor en un punto específico
        %punto = input('Ingrese el valor de x para evaluar el error: ');
        punto = 0;
        valor_real = double(subs(f, x, punto));  % Evaluar la función real
        valor_taylor = double(subs(T, x, punto));  % Evaluar la serie de Taylor
    
        % Usar la función calcularErrores
        [e_abs, e_rel] = calcularErrores(valor_taylor, valor_real);  % Calcular el error
    
        fprintf('Valor real en x = %.4f: %.8f\n', punto, valor_real);
        fprintf('Valor aproximado (Taylor) en x = %.4f: %.8f\n', punto, valor_taylor);
        
        fplot(f, [x0-10, x0+10], 'b-', 'LineWidth', 1.5); % Gráfica de f(x)
        hold on;
        fplot(T, [x0-10, x0+10], 'r--', 'LineWidth', 1.5); % Gráfica de la serie de Taylor
        legend('Función Original', 'Serie de Taylor');
        grid on;
        title(['Aproximación con Serie de Taylor alrededor de x_0 = ', num2str(x0)]);
        xlabel('x');
        ylabel('f(x)');
        hold off;
end




