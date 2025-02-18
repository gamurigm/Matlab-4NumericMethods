function [p] = LagrangeInt(X, f)

if nargin <2
X = input("Ingrese X en forma matricial: ")
f = input("Ingrese f de forma matricial: ")
end

clc;
syms x;

n = length(X);
p = 0;

plot(X, f, 'b*')
hold on 

%Calcular el L
for i=1:n
    L=1
    for j=1:n
        if i ~=j
        L = L*(x -X(j))/(X(i)-X(j))
        end
    end
    p = p+L*f(i)
end

p = expand(p)
pretty(p)
hold on 

fplot(p, [min(X), max(X)], 'k')

x = input("ingresa el valor de x (dentro de la mat X) a interpolar la función x= ")
p_int = eval(p)
hold on 
plot(x, p_int, 'o', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'g')

end










