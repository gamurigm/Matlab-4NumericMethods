function solutions = ODEsolver(eqn)
    % solveODE: Resuelve una ecuación diferencial y devuelve un vector con todas las soluciones.
    % 
    % Parámetros:
    %   eqn: Ecuación diferencial simbólica (definida con `syms y(x)` y `diff`).
    %
    % Salida:
    %   solutions: Vector de soluciones simbólicas de la ecuación diferencial.
    
    % Asegurarse de que la ecuación está correctamente definida
    if ~isa(eqn, 'sym')
        error('La entrada debe ser una ecuación simbólica.');
    end
    
    % Resolver la ecuación diferencial
    solutions = dsolve(eqn, 'MaxDegree', 4); 
    
    % Asegurarse de devolver un vector
    if ~iscell(solutions) % Si solo hay una solución, convertirla en celda
        solutions = {solutions};
    end

    disp(solutions);
end
