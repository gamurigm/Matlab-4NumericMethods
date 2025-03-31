r = 20;  
l = 0.5;  
c = 0.05;  
v_s = @(t) 10 * sin(2 * t);  
t_final = 5;  
ht = 0.01;  
t = 0:ht:t_final;  
n = length(t);  
vC = zeros(1, n);  

vC(1) = 0;  
vC(2) = 0;  


for i = 2:n-1     
    vC(i+1) = 2*vC(i) - vC(i-1) + (ht^2 / l) * (v_s(t(i)) - r*vC(i) - (1/c)*vC(i));  
end  

% a. vC en t=1s
vC_1s = vC(round(1/ht) + 1);  
disp(['Voltaje en el capacitor vC en t=1s: ' num2str(vC_1s)]);  

% b. 
x = t;  
y = vC;  
x_vals = linspace(min(x), max(x), 100);  
P_vals = zeros(size(x_vals));  
n = length(x);  

for k = 1:length(x_vals)     
    P = 0;      
    for i = 1:n         
        L = 1;         
        for j = 1:n             
            if j ~= i                 
                L = L * (x_vals(k) - x(j)) / (x(i) - x(j));              
            end         
        end         
        P = P + y(i) * L;      
    end     
    P_vals(k) = P;  
end  
