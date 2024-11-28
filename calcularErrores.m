function [e_abs, e_rel] = calcularErrores(x, x_star)
   %calcularErrores x*: es el valor EXACTO
   %devulve un vector con el err absoluto y el err relativo
    
    e_abs = abs(x - x_star);
    e_rel = (e_abs / abs(x))*100;

    fprintf('Error Absoluto (ea) = %.4f\n', e_abs);
    fprintf('Error Relativo (er) = %.4f%%\n', e_rel);

end
