function gaussSeidelSolver()
    % Ingreso manual de la matriz A y el vector b
    disp('Ingrese la matriz A (coeficientes del sistema):');
    A = input('Matriz A: ');  % Ingreso de la matriz A
    
    % Verificar que la matriz A sea cuadrada
    if size(A, 1) ~= size(A, 2)
        error('La matriz A debe ser cuadrada');
    end
    
    disp('Ingrese el vector b (términos independientes):');
    b = input('Vector b: ');  % Ingreso del vector b

    % Verificar que el vector b tenga la dimensión correcta
    if length(b) ~= size(A, 1)
        error('El vector b debe tener la misma dimensión que la matriz A');
    end

    % Obtener dimensión de la matriz
    n = size(A, 1);

    % Mostrar el sistema ingresado
    disp('Sistema ingresado:');
    disp('Matriz A:');
    disp(A);
    disp('Vector b:');
    disp(b);

    % Verificaciones de la matriz
    disp('Verificaciones de la matriz:');

    % 1. Verificar si es diagonalmente dominante
    isDiagDom = true;
    for i = 1:n
        if abs(A(i,i)) <= sum(abs(A(i,:))) - abs(A(i,i))
            isDiagDom = false;
            break;
        end
    end
    if isDiagDom
        disp('- La matriz es diagonalmente dominante');
    else
        disp('- ADVERTENCIA: La matriz no es diagonalmente dominante');
        disp('  El método podría no converger');
    end

    % 2. Verificar si es simétrica
    if isequal(A, A.')
        disp('- La matriz es simétrica');
    else
        disp('- La matriz no es simétrica');
    end

    % 3. Verificar valores propios
    eigenValues = eig(A);
    if all(eigenValues > 0)
        disp('- La matriz es definida positiva');
    else
        disp('- ADVERTENCIA: La matriz no es definida positiva');
        disp('  El método podría no converger');
    end

    % Parámetros del método
    tol = 1e-3;
    maxIter = 100;
    x = zeros(n,1);
    iter = 0;
    error = inf;

    % Método Gauss-Seidel
    disp('Iniciando método de Gauss-Seidel...');
    while error > tol && iter < maxIter
        x_old = x;

        for i = 1:n
            suma = 0;
            for j = 1:n
                if j ~= i
                    suma = suma + A(i,j) * x(j);
                end
            end
            x(i) = (b(i) - suma) / A(i,i);
        end

        error = norm(x - x_old, inf);
        iter = iter + 1;
    end

    % Mostrar resultados
    if iter < maxIter
        fprintf('\nEl método convergió en %d iteraciones', iter);
        disp('Solución encontrada:');
        for i = 1:n
            fprintf('x%d = %.6f\n', i, x(i));
        end

        % Verificar la solución
        fprintf('\nVerificación (A*x): \n');
        disp(A*x);
        disp('Vector b original:');
        disp(b);

        % Calcular el error residual
        residual = norm(A*x - b);
        fprintf('Error residual: %.2e\n', residual);
    else
        disp('¡ADVERTENCIA! El método no convergió');
        disp('Intente con un sistema de ecuaciones diferente');
    end
end
