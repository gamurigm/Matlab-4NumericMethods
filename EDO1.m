syms x(t);
 
m = 5; c = 0.25; k = 0.8; x0 = 1; v0 = 0; % c. i

ED = diff(x,t,2) + (c/m)*diff(x,t) + (k/m)*x == 0;

Dx = diff(x,t);
sol = dsolve(ED, x(0)==x0, Dx(0)==v0)

pretty(sol)

%Gráfica de la Función
t_vals = linspace(0, 50, 1000);
x_vals = double(subs(sol, t, t_vals));
 
plot(t_vals, x_vals, 'r', LineStyle='-')

