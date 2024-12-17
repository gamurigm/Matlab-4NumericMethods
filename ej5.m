y = @(t) 6 + 2.13*t.^2 - 0.0013*t.^4;
dy = @(t) (y(t + 1e-5) - y(t)) / 1e-5;
t0 = input('Ingrese el valor inicial t0: ');
t1 = input('Ingrese el valor inicial t1: ');
tol = input('Ingrese la tolerancia: ');
max_iter = input('Ingrese el número máximo de iteraciones: ');
iter = 0;

while iter < max_iter
    iter = iter + 1;
    
    f_t0 = dy(t0);
    f_t1 = dy(t1);
    
    if f_t0 * f_t1 > 0
        error('Los puntos iniciales no encierran la raíz.');
    end
    
    t_new = (t0 + t1) / 2;
    f_t_new = dy(t_new);
    
    if abs(f_t_new) < tol
        break;
    end
    
    if f_t0 * f_t_new < 0
        t1 = t_new;
    else
        t0 = t_new;
    end
end

altura_max = y(t_new);
fprintf('t = %.5f segundos\n', t_new);
fprintf('Altura máxima alcanzada: %.5f metros\n', altura_max);
