function GaussJordan(A, B)
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

    % Crear la matriz aumentada sin modificar A
    if size(B, 2) ~= n
        error("B debe ser un vector fila con %d columnas.", n);
    end
    A_aumentada = [A B'];
    fprintf("Matriz aumentada inicial:\n");
    disp(A_aumentada);

    % Eliminación Gauss-Jordan
    for j = 1:n
        % Hacer que el elemento A_aumentada(j,j) sea 1
        A_aumentada(j, :) = A_aumentada(j, :) / A_aumentada(j, j);
        
        % Hacer ceros en la columna j
        for i = 1:n
            if i ~= j
                A_aumentada(i, :) = A_aumentada(i, :) - A_aumentada(i, j) * A_aumentada(j, :);
            end
        end
        
        fprintf("Matriz después de hacer 1 en posición (%d, %d) y ceros en la columna %d:\n", j, j, j);
        disp(A_aumentada);
    end

    % La solución está en la última columna de la matriz aumentada
    x = A_aumentada(:, end);
    
    % Mostrar la solución
    disp("La solución del sistema de ecuaciones lineales es:");
    disp(round(x,3));

    % Verificación AX = B
    disp("Verificación de AX = B:");
    B_verificado = A * x; % Usar la matriz original A
    disp("B obtenido:");
    disp(round(B_verificado,3));
    disp("B original:");
    disp(B');

    if isequal(round(B_verificado, 10), round(B', 10))
        disp("La solución es correcta: AX = B.");
    else
        disp("La solución no es válida: AX ≠ B.");
    end
end