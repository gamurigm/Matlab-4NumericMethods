function area = areaBajoCurvaLineal(m, b, x1, x2)
% areaBajoCurvaLineal calcula el área bajo la curva de una función lineal
% en un intervalo definido.
% Parámetros:
%   m: pendiente de la función lineal (y = mx + b).
%   b: término independiente de la función lineal.
%   x1, x2: límites del intervalo en el eje x.
% Salida:
%   area: el área bajo la curva en el intervalo [x1, x2].

    % Fórmula para el área bajo la curva: integral definida
    % ∫(mx + b) dx = (m/2)*x^2 + b*x
    area = (m / 2) * (x2^2 - x1^2) + b * (x2 - x1);
end