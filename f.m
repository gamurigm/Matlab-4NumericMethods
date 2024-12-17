%script para resolver con el método de la secante
f= @ (x) ; % despues de (x) escribir la función

x0= 
x1= 
tol= 
error=100;
n=0;

fprintf('  n      xo    x1      x2       error  \n');

while (error>tol)
  x2=x1-(x1-x0)*f(x1)/(f(x1)-f(x0));
  error=abs(f(x2));
  fprintf('  %i    %4.4f  %4.4f   %4.4f    %6.5f \n',n,x0,x1,x2,error);
  x0=x1;
  x1=x2;
  n=n+1;
end

niter=n;
fprintf('raiz = %f \n',x2);