h=0.1;
x0=0;
y0=1;
x_final = 0.3;

x= x0:h:x_final;
y=zeros(size(x0))

y(1)=y0;

for i = 1 :length(x)-1
    f = 1-x(i)-y(i);
    %euler
    y(i+1)=y(i)+h*f;
     x(i+1) = x(i) + h;
end

figure;
% Mostrar resultados
table(x', y', 'VariableNames', {'x', 'y'})

% Graficar la solución aproximada
plot(x, y, '-o', 'LineWidth', 2, 'MarkerSize', 6);
grid on;
xlabel('x');
ylabel('y');
title('Solución aproximada usando el método de Euler');