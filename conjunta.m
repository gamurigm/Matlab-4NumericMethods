% % Parámetros del circuito
% R = 10;      % Resistencia en ohms
% L = 1;       % Inductancia en henrios
% C = 0.2;     % Capacitancia en faradios
% 
% % Parámetros de simulación
% h = 0.01;    % Paso de tiempo
% t = 0:h:5;   % Vector de tiempo
% N = length(t);
% 
% % Inicialización de vectores
% vc = zeros(1,N);
% vs = 10*sin(2*t);  % Voltaje de la fuente
% 
% % Condiciones iniciales
% vc(1) = 0;
% vc(2) = 0;  % Primera iteración asumiendo reposo inicial
% 
% % Implementación del método iterativo
% for n = 2:N-1
%     vs_next = 10*sin(2*t(n+1));
%     vc(n+1) = 2*vc(n) - vc(n-1) + ...
%               h^2*((vs_next - vs(n))/h - ...
%               R*(vc(n) - vc(n-1))/h - ...
%               vc(n)/C)/L;
% end
% 
% % Encontrar el valor en t = 1s
% t_target = 1;
% index = round(t_target/h) + 1;
% fprintf('Voltaje en t = 1s: %.4f V\n', vc(index));
% 
% % Calcular polinomio de Lagrange alrededor de t = 1s
% t_points = 5; % Número de puntos a usar para interpolación
% start_index = max(1, index - floor(t_points/2));
% end_index = min(N, start_index + t_points - 1);
% 
% % Obtener puntos para interpolación
% t_interp = t(start_index:end_index);
% v_interp = vc(start_index:end_index);
% 
% % Función para calcular término básico de Lagrange
% function L = lagrange_term(x, xi, xj)
%     L = prod((x - xj)./(xi - xj));
% end
% 
% % Calcular polinomio de Lagrange en t = 1s
% v_lagrange = 0;
% for i = 1:length(t_interp)
%     % Calcular producto para todos los puntos excepto i
%     other_points = t_interp([1:i-1, i+1:end]);
%     L_i = lagrange_term(t_target, t_interp(i), other_points);
%     v_lagrange = v_lagrange + v_interp(i) * L_i;
% end
% 
% fprintf('Voltaje interpolado (Lagrange) en t = 1s: %.4f V\n', v_lagrange);
% 
% % Graficar resultados
% figure;
% plot(t, vc, 'b-', 'LineWidth', 1);
% hold on;
% plot(t_interp, v_interp, 'ro', 'MarkerSize', 8);
% plot(t_target, v_lagrange, 'g*', 'MarkerSize', 12);
% grid on;
% xlabel('Tiempo (s)');
% ylabel('Voltaje (V)');
% title('Voltaje del Capacitor con Interpolación de Lagrange');
% legend('Voltaje calculado', 'Puntos de interpolación', 'Valor interpolado');

% R = 10; L = 1; C = 0.2;
% h = 0.01; t = 0:h:5; N = length(t);
% 
% vc = zeros(1, N);
% vs = 10 * sin(2 * t);
% 
% vc(1) = 0; vc(2) = 0;
% 
% for n = 2:N-1
%     vsig = 10 * sin(2 * t(n+1));
%     vc(n+1) = 2 * vc(n) - vc(n-1) + ...
%               h^2 * ((vsig - vs(n)) / h - ...
%               R * (vc(n) - vc(n-1)) / h - ...
%               vc(n) / C) / L;
% end
% 
% ti = 1;
% i = round(ti / h) + 1;
% fprintf('Voltaje en t=1s: %.4f V\n', vc(i));
% 
% p = 5;
% ini = max(1, i - floor(p / 2));
% fin = min(N, ini + p - 1);
% 
% tx = t(ini:fin);
% vx = vc(ini:fin);
% 
% function L = lag(x, xi, xj)
%     L = prod((x - xj) ./ (xi - xj));
% end
% 
% v_lag = 0;
% for k = 1:length(tx)
%     otros = tx([1:k-1, k+1:end]);
%     Li = lag(ti, tx(k), otros);
%     v_lag = v_lag + vx(k) * Li;
% end
% 
% fprintf('Interpolado en t=1s: %.4f V\n', v_lag);
% 
% figure;
% plot(t, vc, 'b-', 'LineWidth', 1);
% hold on;
% plot(tx, vx, 'ro', 'MarkerSize', 8);
% plot(ti, v_lag, 'g*', 'MarkerSize', 12);
% grid on;
% xlabel('Tiempo (s)');
% ylabel('Voltaje (V)');
% title('Voltaje con Interpolación de Lagrange');
% legend('Voltaje', 'Puntos', 'Interpolado');


clear; clc;

% Definir la función F(x,y) = 4 + x^2 + y^2
f = @(x,y) 4 + x.^2 + y.^2;

% Límites de integración
x_min = 0; x_max = 2;
y_min = 1; y_max = 3;

% Número de subdivisiones (deben ser pares para Simpson)
n = 20; % En x
m = 20; % En y

% Calcular tamaños de paso
hx = (x_max - x_min) / n;
hy = (y_max - y_min) / m;

% Generar los puntos x e y
x = x_min:hx:x_max;
y = y_min:hy:y_max;

% Inicializar la suma
S = 0;

% Aplicar el método de Simpson en dos direcciones
for j = 1:length(y)
    % Coeficiente de Simpson en la dirección y
    if j == 1 || j == length(y)
        coef_y = 1; % Bordes
    elseif mod(j,2) == 0
        coef_y = 4; % Puntos impares en y
    else
        coef_y = 2; % Puntos pares en y
    end
    
    % Integral en la dirección x usando Simpson
    I_x = 0;
    for i = 1:length(x)
        % Coeficiente de Simpson en la dirección x
        if i == 1 || i == length(x)
            coef_x = 1; % Bordes
        elseif mod(i,2) == 0
            coef_x = 4; % Puntos impares en x
        else
            coef_x = 2; % Puntos pares en x
        end
        
        % Sumar con el coeficiente de Simpson
        I_x = I_x + coef_x * f(x(i), y(j));
    end
    
    % Multiplicar por el paso y el coeficiente de Simpson en y
    S = S + coef_y * I_x * (hx / 3);
end

% Aplicar el paso en y
S = S * (hy / 3);

% Mostrar el resultado
fprintf('La superficie de la región es aproximadamente: %.4f\n', S);
