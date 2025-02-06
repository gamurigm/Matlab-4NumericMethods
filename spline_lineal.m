function spline_lineal(X,Y)
X=input('X = ') % ingrese en forma de vector
Y=input('Y = ') % ingrese en forma de vector
n=length(X); % tamano de la matriz
for k=1:n-1 
m=(Y(k+1)-Y(k))/(X(k+1)-X(k)); % pendiente de la recta entre dos puntos
b=Y(k)-m*X(k);
if b>0
fprintf('\n %fx+%f \t para x en [%.3f, %.3f]',m,b,X(k),X(k+1))
elseif b<0
fprintf('\n %fx-%f \t para x en [%.3f,%.3f]',m,abs(b),X(k),X(k+1))
else
fprintf('\n %fx \t \t para x en [%.3f, %.3f] \n',m,X(k),X(k+1))
end
end
fprintf('\n\n')
plot(X,Y,'*k',X,Y)
hold on 

x= input('\n Ingrese un valor de x  a interpolar: ');
y=interp1 (X, Y, x);
plot(x,y,'*b')