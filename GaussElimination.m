A=[-0.04 0.04 0.12; 0.56 -1.56 0.32; -0.24 1.24 -0.28];
B=[3 1 0]';
A=[A B];

n=size(A,1);

for i = 1:n-1
    for j = i+1:n
        factor = A(j,i) / A(i,i);
        for k= i:n+1
            A(j,k) = A(j,k)-factor * A(i,k);
        end
    end
end

X = zeros(n, 1);
X(n) = A(n, end) / A(n, n);

for i = n-1:-1:1
    suma = 0;
    for j = i+1:n
        suma = suma + A(i, j) * X(j);
    end
    X(i) = (A(i, end) - suma) / A(i, i);
end

X;
disp(X)