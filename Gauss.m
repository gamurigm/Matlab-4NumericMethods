function [x] = Gauss(A, B)
    A = input("Ingresa una Matriz Cuadrada entre Corchetes A: ");
    B = input("Ingresa el vector fila B entre Corchetes B: ");

    n = size(A); % Obtener dimensiones de la matriz A
    fprintf("El tamaño de la Matriz %d x %d\n", n(1), n(2));

    % Verificar si la matriz A es cuadrada
    if n(1) == n(2)
        disp("La Matriz es cuadrada");
        n = n(1); % Guardar el número de filas/columnas
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

    % Concatenar A con B' para formar la matriz aumentada
    if size(B, 2) ~= n
        error("B debe ser un vector fila con %d columnas.", n);
    end
    A = [A B'];
    fprintf("Matriz aumentada inicial:\n");
    disp(A);

    % Eliminación Gaussiana hacia adelante
    for j = 1:n-1
        for i = j+1:n
            factor = A(i, j) / A(j, j); % Calcular el factor
            A(i, :) = A(i, :) - factor * A(j, :); % Actualizar la fila
            fprintf("Matriz después de hacer 0 en posición (%d, %d):\n", i, j);
            disp(A);
        end
    end

    % Sustitución regresiva
    x = zeros(n, 1);
    x(n) = A(n, end) / A(n, n);

    for i = n-1:-1:1
        suma = 0;
        for j = i+1:n
            suma = suma + A(i, j) * x(j);
        end
        x(i) = (A(i, end) - suma) / A(i, i);
    end

    % Mostrar la solución
    disp("La solución del sistema de ecuaciones lineales es:");
    disp(x);
end
