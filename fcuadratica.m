
function [y]=fcuadratica(a,b,c) 
%Esta función grafica cualquier función cuadrática
% de donde:
% [y] es el vector salida 
% a, b, c son la entrada como coeficientes
%-------------------------------------------------

v = -b/(2*a); %vertice 
x = v-10:0.5:v+10; %vector de valores a graficar 
y = a*x.^2 + b*x + c; % recordar .^2

plot (x,y, '--g'), grid;

hold on; 
plot(v,a*v.^2 + b*v + c, '*r') % graficamos v(x,y); elvaluando (x = v)

hold off

