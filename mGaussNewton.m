function [X, k]=mGaussNewton(x0)
% Método de Gauss-Newton
% Entradas:
% fname .- cadena con el nombre de la función.
% x0 .- vector columna de dimension n, es el punto incial
% b .- valores
% Out
% xmin .- vector columna de dimension n, es la aproximación al mínimo local
% k .- número de iteraciones

% Parámetros del método
tol=1e-5;
kmax=100;

% Calculamos la matriz jacobiana de los residuales
J= jacobiana('R',x0);

% Calculamos el gradiente de f
grad=J'*R(x0);
normG=norm(grad);

k=0;
x=x0;
X=[];
while(normG>tol && k<kmax)
    B=J'*J;
    % Encontramos una dirección p
    p=B\(-grad);
    
    % Búsqueda de línea
    c1 = 0.1;                   % valor para la condición de Wolfe
    alfa  = 1;                  % paso completo
    xt = x + alfa*p;            % primer punto de prueba
    f  = feval('ftrigo',x);     % valor de la función
    f1 = feval('ftrigo', xt);   % valor de la función en el punto de prueba
    s  = p'*grad;               % derivada direccional
    maxjter = 30;               % número máximo de iteraciones internas de BL permitidas
    jter = 0;                   % iteraciones internas
    
    while( (f1>f+alfa*c1*s) && jter < maxjter)  % búsqueda de línea
       alfa = alfa/2;
       xt = x + alfa*p;
       f1 = feval('ftrigo', xt);% valor de la función en el punto de prueba
       jter = jter +1;
    end   
    % Fin de búsqueda de línea
    
    % Hacemos un paso del método
    x=xt;
    % Guardamos el valor del paso
    X= [x'; X];
    % Actualizamos los parámetros
    J= jacobiana('R',x);
    grad=J'*R(x);
    normG=norm(grad);
    k=k+1;
end
end