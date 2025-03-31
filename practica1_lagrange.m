% x= [2 4 6 8 10  ];
% y= [1 2 6 3 7];

% xp = 0;
% P = 0;
% 
% n = length(xp);
% 
% for i = 1:n
%     L = 1;
%     for j = 1:n
%         if j ~=i
%             L = L*(xp-x(j)/(x(i)-x(j)));
%         end
%     end
%     P = P + y(i)*L;
% end



% Generar puntos para la gráfica del polinomio interpolado
% x_vals = linspace(min(x), max(x), 100);
% P_vals = zeros(size(x_vals));

% for k = 1:length(x_vals)
%     P = 0;
%     for i = 1:length(x)
%         L = 1;
%         for j = 1:length(x)
%             if j ~= i
%                 L = L * (x_vals(k) - x(j)) / (x(i) - x(j));
%             end
%         end
%         P = P + y(i) * L;
%     end
%     P_vals(k) = P;
% end
% 
% % Graficar los puntos conocidos y el polinomio interpolado
% plot(x, y, 'ro'); % Puntos conocidos
% hold on;
% plot(x_vals, P_vals, 'b-'); % Polinomio interpolado
% grid on;
% xlabel('x');
% ylabel('P(x)');
% title('Interpolación de Lagrange');
% legend('Puntos conocidos', 'Polinomio interpolado');
% hold off;



% Método de Simpson 1/3 en MATLAB
f = @(x) x.^2; 
a = 0; 
b = 6;
n = 4; % sub ints (debe ser par)
h = (b - a) / n;% Calcular el tamaño del paso

x = a:h:b; % Calcular los puntos x y evaluar la función en ellos
y = f(x);

I = (h / 3) * (y(1) + 4 * sum(y(2:2:end-1)) + 2 * sum(y(3:2:end-2)) + y(end));

disp(['Aproximación de la integral (Simpson 1/3): ', num2str(I)]);



% Método de Simpson 3/8 
f = @(x) x.^2; 
a = 0; 
b = 3; 
n = 3; % (múltiplo de 3)
h = (b - a) / n;   % Calcular el tamaño del paso

x = a:h:b; % Calcular los puntos x y evaluar la función en ellos
y = f(x);

I = (3 * h / 8) * (y(1) + 3 * sum(y(2:3:end-1)) + 3 * sum(y(3:3:end-1)) + 2 * sum(y(4:3:end-3)) + y(end));

disp(['Aproximación de la integral (Simpson 3/8): ', num2str(I)]);
