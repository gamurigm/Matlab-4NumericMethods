% function D = opera(A)
% 
%     B = A([2, 4, 5], [1, 3]);
% 
% 
%     C = A([1, 2], [2, 4, 5]);
% 
% 
%     D = 2 * B - 5 * C';
% end
% 
% A=[2 5 6 3 1;8 9 1 0 -1;9 -6 5 2 -2;-5 9 1 1 3;5 4 3 7 -5];
% 
% D=opera(A)
% disp(D)





% function result = multip(A, B)
% 
% A=[2 5 6 3;8 9 1 0;9 6 5 2];
% B=[2 5 6 3;8 9 1 0;9 6 5 2;6 2 1 -1];
% 
%     fila_A = A(2, :);
% 
% 
%     fila_B = B(3, :);
% 
% 
%     result = fila_A .* fila_B';
% 
%     diag(result)
% 
% end

% function resultado = multip(A, B)
%     A=[2 5 6 3;8 -9 1 0;9 6 5 2;13 -2 -3 -5];
%     B=[2 5 6 3;8 9 1 0;9 -6 5 2;6 2 1 -1];
%     columnaA = A(:, 4);
% 
% 
%     filaB = B(1, :);
% 
% 
%     resultado = columnaA .* filaB;
%     disp(resultado)
% end

% Si la función se evalúa fuera del dominio, debe imprimirse el siguiente mensaje: "No existe f(c)", donde c es el valor de x que no está en el dominio de la función, además c debe imprimirse con 4 cifras significativas (2 decimales). El script debe correr varias pruebas, mire el ejemplo.
% 
% Obs: Existe una plantilla cargada que no debe borrar, solamente complete y modifique lo que sea necesario para obtener la salida de acuerdo al ejemplo. Si observa con detenimiento en la plantilla, al final solo se imprime el valor de y, por lo que deberá usar (;) en las líneas anteriores para evitar la impresión de otras expresiones.

%7.2 si x<0
%5+8x si 1 < x < 2.5  
%losg(x)  si x >15

% function y=f(x) %no modifique esta línea
% 
% 
%   else %complete lo necesario para obtener la respuesta de acuerdo al ejemplo
%     y=[];
%     fprintf('No existe f(c) \n',x);
%   end
% 
% %no modifique las dos últimas líneas
% 
%  end



function y = f(x) % No modifique esta línea

  if x < 0
      y = 7.2; % Caso 1: x < 0
  elseif x > 1 && x < 2.5
      y = 5 + 8 * x; % Caso 2: 1 < x < 2.5
  elseif x > 15
      y = log(x); % Caso 3: x > 15
  else
      % Caso fuera del dominio
      y = [];
      fprintf('No existe f(%.2f)\n', x); % Se imprime con dos decimales
  end
  
% No modifique las dos últimas líneas
y 

end

