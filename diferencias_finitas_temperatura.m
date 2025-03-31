function T = diferencias_finitas_temperatura(L, h, T0, TL)
    % Método de Diferencias Finitas para resolver d^2T/dx^2 = 0 en una barra
    % L   Longitud de la barra (cm)
    % h   Tamaño de paso (cm)
    % T0  Temperatura en x=0
    % TL  Temperatura en x=L
    
    % Definir el número de puntos internos
    N = L/h - 1;
    
    % Construcción de la matriz de coeficientes
    A = -2 * eye(N) + diag(ones(N-1,1), 1) + diag(ones(N-1,1), -1);


% Construcción del vector de términos independientes
    b = zeros(N,1);
    
    % Incorporar condiciones de frontera
    b(1) = -T0;
    b(N) = -TL;
    
    % Resolver el sistema de ecuaciones lineales
    T_interior = A\b;


    % Construir el vector de temperaturas incluyendo condiciones de frontera
    T = [T0; T_interior; TL];
    
    % Visualizar la solución
    x = 0:h:L;
    plot(x, T, '-o', 'LineWidth', 2)
    xlabel('Posición en la barra (cm)')
    ylabel('Temperatura (°C)')
    title('Distribución de Temperatura en la Barra')
    grid on
end
