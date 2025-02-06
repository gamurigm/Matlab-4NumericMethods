function [p] = NewtonInt(X, f)

X = input("Ingrese X en forma matricial: ")
f = input("Ingrese f de forma matricial: ")

clc;
syms x;

n = length(X);

plot(X, f, 'b*')
hold on 

d=zeros(n)
d(:,1)=f'

for j=2:n
    for i=j:n
        d(i,j)=(d(i,j-1)-d(i-1,j-1))/(X(i)-X(i-j+1));
    end
end

disp("la matriz de diferencias divididas es: ");
disp(d)
disp("El polinomio de Newton es: ");
polnew=d(1,1)
p=1;
for i=1:n-1
    p=p*(x-X(i));
    polnew=polnew+p*d(i+1,i+1);
end

polnew=expand(polnew);
pretty(polnew)

ezplot(polnew,[X(1),X(end)])
%x=input('ingrese el val de x a interpolar: ');
