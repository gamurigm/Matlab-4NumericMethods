function LU(A, B)
    if nargin < 2
    % Entrada de datos
    A = input("Ingresa una Matriz Cuadrada entre Corchetes A: ");
    B = input("Ingresa el vector fila B entre Corchetes B: ");
    
    % Obtener dimensiones de A
    n = size(A);
    fprintf("El tamaño de la Matriz %d x %d\n", n(1), n(2));
    
    % Verificar si la matriz A es cuadrada
    if n(1) == n(2)
        disp("La Matriz es cuadrada");
        n = n(1); % Guardar número de filas
    else
        error("La Matriz NO es cuadrada, vuelva a ingresar!");
    end
    
    % Verificar si el sistema tiene solución única
    determinate = det(A);
    if determinate ~= 0
        disp("El SEL tiene Solución");
    else
        error("El SEL NO tiene Solución");
    end
    
    % Verificar dimensiones de B
    if size(B, 2) ~= n
        error("B debe ser un vector fila con %d columnas.", n);
    end
    
    % Inicializar matrices L y U
    L = eye(n);
    U = A;
    
    % Descomposición LU
    fprintf("Iniciando descomposición LU...\n");
    for k = 1:n-1
        for i = k+1:n
            factor = U(i,k)/U(k,k);
            L(i,k) = factor;
            U(i,k:n) = U(i,k:n) - factor*U(k,k:n);
            
            fprintf("Matriz L después de la iteración (%d, %d):\n", i, k);
            disp(L);
            fprintf("Matriz U después de la iteración (%d, %d):\n", i, k);
            disp(U);
        end
    end
    
    % Resolver Ly = B' (sustitución hacia adelante)
    y = zeros(n,1);
    B = B';  % Convertir B a vector columna
    fprintf("\nResolviendo Ly = B...\n");
    y(1) = B(1);
    for i = 2:n
        y(i) = B(i) - L(i,1:i-1)*y(1:i-1);
    end
    disp("Vector y obtenido:");
    disp(y);
    
    % Resolver Ux = y (sustitución hacia atrás)
    fprintf("\nResolviendo Ux = y...\n");
    x = zeros(n,1);
    x(n) = y(n)/U(n,n);
    for i = n-1:-1:1
        suma = y(i);
        for j = i+1:n
            suma = suma - U(i,j)*x(j);
        end
        x(i) = suma/U(i,i);
    end
    
    % Mostrar resultados
    disp("La solución del sistema de ecuaciones lineales es:");
    disp(x);
    
    % Verificación AX = B
    disp("Verificación de AX = B:");
    B_verificado = A * x;
    disp("B obtenido:");
    disp(B_verificado);
    disp("B original:");
    disp(B);
    
    if isequal(round(B_verificado, 10), round(B, 10))
        disp("La solución es correcta: AX = B.");
    else
        disp("La solución no es válida: AX ≠ B.");
    end
    
    % Mostrar las matrices L y U finales
    disp("Matriz L final:");
    disp(L);
    disp("Matriz U final:");
    disp(U);
    disp("Verificación A = L*U:");
    if isequal(round(A, 10), round(L*U, 10))
        disp("La descomposición LU es correcta: A = L*U");
    else
        disp("Error en la descomposición LU: A ≠ L*U");
    end
end