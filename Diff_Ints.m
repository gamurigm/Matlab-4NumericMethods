syms x;
y = x^3 - 2*x^2 + x; % Función
dy = diff(y);         % Derivada
intY = int(y);        % Integral indefinida

fplot(y, [-2, 3], 'r');     % Gráfica de la función original
hold on;                   % Mantener el gráfico
fplot(dy, [-2, 3], 'b');    % Gráfica de la derivada
fplot(intY, [-2, 3], 'g');  % Gráfica de la integral
legend('Función', 'Derivada', 'Integral');
xlabel('x');
ylabel('y');
grid on;
title('Función, Derivada e Integral');
hold off