function [f, root] = fun_es(x)
    % f(x):
    f = x.^3 - 3 * x.^2 + 2;
   
    if nargout > 1 % Si se solicita, encontrar la raíz usando bisección
        syms z;
        fun_sym = z.^3 - 3 * z.^2 + 2;
        % Llamar a Biseccion con un intervalo que contenga una raíz
        [root, ~] = Biseccion(fun_sym, 1, 2);
    end
end