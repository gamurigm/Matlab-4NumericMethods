function [e_abs, e_rel] = calcularErrores(x, x_star)
    % calcularErrores: Calcula el error absoluto y relativo.
    % x: valor aproximado.
    % x_star: valor exacto.
    % e_abs: error absoluto.
    % e_rel: error relativo en porcentaje.

    % Error absoluto
    e_abs = abs(x - x_star);

    % Error relativo
    if abs(x_star) > 1e-12  % Prevenir división por números cercanos a cero
        e_rel = (e_abs / abs(x_star)) * 100;
    else
        e_rel = NaN;  
        warning('El valor exacto es muy pequeño o cero, el error relativo no es confiable.');
    end
    % fprintf('Error Absoluto (ea) = %.4f\n', e_abs);
    % fprintf('Error Relativo (er) = %.4f%%\n', e_rel);
end
